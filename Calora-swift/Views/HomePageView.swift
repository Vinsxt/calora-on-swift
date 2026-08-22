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
    @Query private var meals: [Meal]
    
    @State private var navigateToInsertMeal = false
    
    // model prototype for meal input:
    @State private var mealDescription: String = ""
    @State private var category: Category? = nil
    @State private var calorie: Int? = nil
    @State private var mealTimeStamp: Date = Date()
    @State private var protein: Int? = nil
    @State private var carbs: Int? = nil
    @State private var fat: Int? = nil
    @State private var logTitle: String = ""
    
    
    var body: some View {
        
        VStack {
            
            Text("Hello, \(profiles.first?.name ?? "Unknown")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 35)
            
            VStack(spacing: 12){ // top content main stack
                
                HStack(spacing: 12){
                    
                    HomePageDailyStatusCard(title: "weight", value: "\(profiles.first?.weight ?? 0) kg")
                    HomePageDailyStatusCard(title: "goal", value: "\(profiles.first?.selectedGoal ?? "nil")")
                    
                }
                
                HStack(spacing: 12){
                    
                    HomePageDailyStatusCard(title: "calories", value: "\(profiles.first?.height ?? 0) cals")
                    HomePageDailyStatusCard(title: "burned", value: "\(profiles.first?.height ?? 0) cals")
                }
            }
            .padding(.top)
            .padding(.horizontal)
            
            ZStack{
                List{
                    MealLogCard(
                            category: "Breakfast",
                            title: "Chicken breast 200g",
                            protein: 40,
                            carbs: 5,
                            fat: 5,
                            calories: 250
                        )
                        MealLogCard(
                            category: "Lunch",
                            title: "Chicken breast 200g",
                            protein: 40,
                            carbs: 5,
                            fat: 5,
                            calories: 250
                        )
                        MealLogCard(
                            category: "Dinner",
                            title: "Chicken breast 200g",
                            protein: 40,
                            carbs: 5,
                            fat: 5,
                            calories: 250
                        )
                    
                    ForEach(meals) {meal in MealLogCard(
                        category: meal.category?.rawValue ?? "Category",
                        title: meal.logTitle,
                        protein: meal.protein ?? 0,
                        carbs: meal.carbs ?? 0,
                        fat: meal.fat ?? 0,
                        calories: meal.calorie ?? 0
                    )
                        
                    }
                    
                }
                .onAppear(){
                    if meals.isEmpty{
                        insertTestMeals()
                    }
                }
                .frame(maxHeight: .infinity)
                .scrollContentBackground(.visible)
                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                VStack {
                    Button(action: {
                        navigateToInsertMeal = true
                    }) {
                        Text("+").tint(.white)
                            .font(.largeTitle)
                            .frame(width: 40, height: 48)
                    }
                    .buttonStyle(.glassProminent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.bottom, 1)
                    .padding(.trailing, 30)
                    .navigationDestination(isPresented: $navigateToInsertMeal){
                        InsertMealView()
                    }
                    
                    Button(action: { // temporary clear list content button
                        deleteAllMeals()
                        
                    }) {
                        Image(systemName: "trash")
                            .tint(.white)
                            .font(.title)
                            .frame(width: 40, height: 48)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.red)
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .padding(.bottom, 20)
                    .padding(.trailing, 30)
                    .navigationDestination(isPresented: $navigateToInsertMeal){
                        InsertMealView()
                    }
                }
 
                }
            
            }.padding(.top)
            
        }
        
        func saveMeal(mealDescription: String, category: Category? = nil, calorie: Int? = nil, mealTimeStamp: Date, protein: Int? = nil, carbs: Int? = nil, fat: Int? = nil, logTitle: String){

            let meal = Meal(mealDescription: mealDescription, category: category, calorie: calorie, mealTimeStamp: mealTimeStamp, protein: protein, carbs: carbs, fat: fat, logTitle: logTitle)
            
            context.insert(meal)
        }
        
        func insertTestMeals(){
            
            saveMeal(mealDescription: "chicken breast 200g", category: .breakfast, calorie: 250, mealTimeStamp: Date(), protein: 40, carbs: 5, fat: 5, logTitle: "Chicken breast")
            
            saveMeal(mealDescription: "eggs, green veggies, apples, more 200g chicken breast", category: .lunch, calorie: 250, mealTimeStamp: Date(), protein: 40, carbs: 50, fat: 5, logTitle: "Fiber + Protein lunch")
            
            saveMeal(mealDescription: "cooked fish, instant noodle, crackers", category: .dinner, calorie: 250, mealTimeStamp: Date(), protein: 30, carbs: 60, fat: 30, logTitle: "Cheat Dinner")
            
            saveMeal(mealDescription: "2 medium banana, 200 gr", category: .snack, calorie: 250, mealTimeStamp: Date(), protein: 30, carbs: 60, fat: 30, logTitle: "Banana pre-workout")
            
            print("inserted meals..?")
            
        }
        
        func deleteAllMeals(){
            for meal in meals {
                context.delete(meal)
                if (meals.isEmpty){
                    print("meals are cleared!")
                }
            }
        }
    }
    
    

#Preview {
    NavigationStack{
        HomePageView()
    }
}
