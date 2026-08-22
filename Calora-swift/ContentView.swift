//
//  ContentView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            Tab("Home", systemImage: "house") {
                HomePageView()
            }

            Tab("Meal Log", systemImage: "fork.knife") {
                MealLogView()
            }


            Tab("Analytics", systemImage: "chart.bar.xaxis.ascending") {
                AnalyticsPageView()
            }
            .badge("!")
            
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                ProfilePageView()
            }
        }
    }
}

#Preview {
    ContentView()
}
