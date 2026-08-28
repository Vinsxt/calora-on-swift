//
//  HealthKitManager.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 28/08/26.
//

import Foundation
import HealthKit
import Observation

@Observable

class HealthKitManager {
    
    let healthStore = HKHealthStore()
    
    var caloriesBurned: Int = 0
    var authStatus: String = "Not requested"
    
    func requestAuthorization() async {
        let readTypes: Set<HKSampleType> = [
            HKQuantityType(.activeEnergyBurned)
        ]
        
        let writeTypes: Set<HKSampleType> = [
            
        ]
        
        guard HKHealthStore.isHealthDataAvailable() else {
            authStatus = "HealthKit is not available on this device"
            return
        }
        do {
            try await healthStore.requestAuthorization(toShare: writeTypes, read: readTypes)
            authStatus = "Auth requested"
        } catch {
            authStatus = "Auth failed \(error.localizedDescription)"
        }
    }
    
    func fetchTodayCalories() async {
        
        let caloriesType = HKQuantityType(.activeEnergyBurned)
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let descriptor = HKStatisticsQueryDescriptor(predicate: HKSamplePredicate<HKQuantitySample>.quantitySample(type: caloriesType, predicate: predicate), options: .cumulativeSum)
        
        do {
            let result = try await descriptor.result(for: healthStore)
            
            if let sum = result?.sumQuantity() {
                let calories = Int(sum.doubleValue(for: HKUnit.largeCalorie()))
                await MainActor.run{
                    self.caloriesBurned = calories
                }
            }
        } catch {
            print("Calories count query failed \(error.localizedDescription)")
        }
    }
    
    func startObservingCalories(){
        
        let caloriesType = HKQuantityType(.activeEnergyBurned)
        
        let observerQuery = HKObserverQuery(sampleType: caloriesType, predicate: nil) { [weak self] query, completionHandler, error in
            
            if let error = error {
                print("Observer error \(error.localizedDescription)")
                completionHandler()
                return
            }
            
            Task {
                await self?.fetchTodayCalories()
            }
            
            completionHandler()
        }
        
        healthStore.execute(observerQuery)
        healthStore.enableBackgroundDelivery(for: caloriesType, frequency: .hourly) { success, error in
        
            if success {
                print("Background delivery enabled for calories")
            }
            else if let error = error {
                print("Background delivery failed \(error.localizedDescription)")
            }
            
        }
        
    }
}
