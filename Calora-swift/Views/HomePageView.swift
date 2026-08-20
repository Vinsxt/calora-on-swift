//
//  HomePageView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 18/08/26.
//

import SwiftUI
import SwiftData

struct HomePageView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var profiles: [UserProfile]
    
    // model prototype for meal input:
    @State private var mealDescription: String = ""
    @State private var calorie: Int? = nil
    @State private var mealTimeStamp: Date = Date()
    @State private var protein: Int? = nil
    @State private var carbs: Int? = nil
    @State private var fat: Int? = nil
    @State private var logTitle: String = ""
    
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Text("Hello, \(profiles.first?.name ?? "Unknown")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 35)
                
            VStack(spacing: 12){
                
                    HStack(spacing: 12){
                        
                        HomePageDailyStatusCard(title: "weight", value: "\(profiles.first?.weight ?? 0) kg")
                      
                        HomePageDailyStatusCard(title: "goal", value: "\(profiles.first?.selectedGoal ?? "nil")")

                    }.padding(.horizontal, 0.1)
                    
                    HStack(spacing: 12){
                        
                        HomePageDailyStatusCard(title: "calories", value: "\(profiles.first?.height ?? 0) cals")
                        
                        HomePageDailyStatusCard(title: "burned", value: "\(profiles.first?.height ?? 0) cals")

                    }.padding(.horizontal, 0.1)
                
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 0)
                    .fill(.gray.opacity(0.2)))
            
            Spacer()
            
        }.padding(.top)
        
        
        
        
        
        
    }
}

#Preview {
    NavigationStack{
        HomePageView()
    }
}
