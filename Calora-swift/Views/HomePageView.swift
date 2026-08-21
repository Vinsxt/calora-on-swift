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
    
    @State private var navigateToInsertMeal = false
    
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
                
            VStack(spacing: 12){ // top content main stack
                
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
            
            List{
                MealLogCard(category: "Breakfast", title: "Chicken breast 200g", protein: 40, carbs: 5, fat: 5, calories: 250)
                
                MealLogCard(category: "Breakfast", title: "Chicken breast 200g", protein: 40, carbs: 5, fat: 5, calories: 250)
                
                MealLogCard(category: "Breakfast", title: "Chicken breast 200g", protein: 40, carbs: 5, fat: 5, calories: 250)
                
                MealLogCard(category: "Breakfast", title: "Chicken breast 200g", protein: 40, carbs: 5, fat: 5, calories: 250)
            }
            .frame(maxHeight: .infinity)
            
            
            ZStack (alignment: .bottomTrailing){
                
                TabView {
                    Tab("Home", systemImage: "house") {
                        // direct to homepage
                    }
                    .badge(2)


                    Tab("Meal Log", systemImage: "fork.knife") {
                        // direct to list of meal logs
                    }


                    Tab("Analytics", systemImage: "chart.bar.xaxis.ascending") {
                        // direct to analytics page
                    }
                    .badge("!")
                    
                    Tab("Profile", systemImage: "person.crop.circle.fill") {
                        // direct to profile editing page
                    }
                }
                
                Button(action: {
                    navigateToInsertMeal = true
                }) {
                    Text("+").tint(.white)
                        .font(.largeTitle)
                        .frame(width: 40, height: 48)
                }
                .buttonStyle(.glassProminent)
                .padding(.bottom, 80)
                .padding(.trailing, 30)
                .navigationDestination(isPresented: $navigateToInsertMeal){
                    InsertMealView()
                }
                
                
            }
            
            
            
        }.padding(.top)
        
        
        
        
        
        
    }
}

#Preview {
    NavigationStack{
        HomePageView()
    }
}
