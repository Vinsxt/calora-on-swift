//
//  MealLogView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 22/08/26.
//

import SwiftUI
import SwiftData

struct MealLogView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var profiles: [UserProfile]
    @Query private var meals: [Meal]
    
    var body: some View {
        
        ZStack{
            
            List{
                MealLogCard(
                    category: "Breakfast",
                    title: "Chicken breast 200g",
                    protein: 40,
                    carbs: 5,
                    fat: 5,
                    calories: 250
                ) {
                    print("print meal")
                }
                MealLogCard(
                    category: "Lunch",
                    title: "Chicken breast 200g",
                    protein: 40,
                    carbs: 5,
                    fat: 5,
                    calories: 250
                ) {
                    print("print meal")
                }
                MealLogCard(
                    category: "Dinner",
                    title: "Chicken breast 200g",
                    protein: 40,
                    carbs: 5,
                    fat: 5,
                    calories: 250
                ) {
                    print("print meal")
                }
                
                ForEach(meals) {meal in MealLogCard(
                    category: meal.category?.displayName ?? "Category",
                    title: meal.logTitle,
                    protein: meal.protein ?? 0,
                    carbs: meal.carbs ?? 0,
                    fat: meal.fat ?? 0,
                    calories: meal.calorie ?? 0
                ) {
                    print("print meal")
                }
                    
                }
                
            }
            .safeAreaPadding(.top, 40)
            .onAppear(){
                if meals.isEmpty{
                    insertTestMeals()
                }
            }
            
            HStack(){
                Button(action: {
                    // code
                }) {
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundStyle(.black)
                        .font(.title)
                        .frame(width: 27, height: 36)
                }
                .buttonStyle(.glassProminent)
                .tint(.white)
                .padding(.bottom, 1)
                
                Button(action: {
                    // code
                }) {
                    Image(systemName: "calendar")
                        .foregroundStyle(.black)
                        .font(.title)
                        .frame(width: 27, height: 36)
                }
                .buttonStyle(.glassProminent)
                .tint(.white)
                .padding(.bottom, 1)
                .padding(.trailing, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            
        }
        
        
        
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
}

#Preview {
    MealLogView()
}
