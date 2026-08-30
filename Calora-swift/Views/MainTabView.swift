//
//  ContentView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI

struct MainTabView: View {
    
    enum AppTabs{
        case home
        case mealLog
        case analytics
        case profile
    }
    
    @State private var selection: AppTabs = .home
    @Environment(HealthKitManager.self) private var manager
    
    var body: some View {
        
        TabView (selection: $selection) {
            Tab("Home", systemImage: "house", value: .home) {
                HomePageView()
            }
            
            Tab("Meal Log", systemImage: "fork.knife", value: .mealLog) {
                MealLogView()
                
            }
            
            
            Tab("Analytics", systemImage: "chart.bar.xaxis.ascending", value: .analytics) {
                AnalyticsPageView()
            }
            .badge("!")
            
            Tab("Profile", systemImage: "person.crop.circle.fill", value: .profile) {
                NavigationStack {
                    ProfilePageView()
                }
            }
        }
    }
}

#Preview {
    MainTabView()
        .environment(HealthKitManager())
}
