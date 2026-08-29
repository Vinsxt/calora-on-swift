//
//  Calora_swiftApp.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI
import SwiftData

@main
struct Calora_swiftApp: App {
    
    @State private var healthKitManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                WelcomePageView()
            }
            .environment(healthKitManager)
        }
        .modelContainer(for: [
            UserProfile.self,
            Meal.self
        ])
    }
}
