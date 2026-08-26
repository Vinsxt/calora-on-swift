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
    
    var groupedMeals: [Date: [Meal]] {
        Dictionary(grouping: meals){
            meal in Calendar.current.startOfDay(for: meal.mealTimeStamp)
        }
    }
    
    var body: some View {
        
        ZStack{
            
            List{
                ForEach(groupedMeals.keys.sorted(by: >), id: \.self) {date in
                    Section{
                        ForEach(groupedMeals[date] ?? []) {meal in MealLogCard(
                            category: meal.category?.displayName ?? "Category",
                            title: meal.logTitle,
                            protein: meal.protein ?? 0,
                            carbs: meal.carbs ?? 0,
                            fat: meal.fat ?? 0,
                            calories: meal.calorie ?? 0,
                            mealTimeStamp: meal.mealTimeStamp
                        ) {
                            print("print meal")
                        }
                        }
                    } header: {
                        Text(date.formatted(date: .long, time: .omitted))
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
        
        let today = Date()
        let yesterday = Calendar.current.date(
            byAdding: .day,
            value: -1,
            to: today
        )!
        let twoDaysAgo = Calendar.current.date(
            byAdding: .day,
            value: -2,
            to: today
        )!
        
        saveMeal(mealDescription: "chicken breast 200g", category: .breakfast, calorie: 250, mealTimeStamp: today, protein: 40, carbs: 5, fat: 5, logTitle: "Chicken breast")
        
        saveMeal(mealDescription: "eggs, green veggies, apples, more 200g chicken breast", category: .lunch, calorie: 250, mealTimeStamp: today, protein: 40, carbs: 50, fat: 5, logTitle: "Fiber + Protein lunch")
        
        saveMeal(mealDescription: "cooked fish, instant noodle, crackers", category: .dinner, calorie: 250, mealTimeStamp: yesterday, protein: 30, carbs: 60, fat: 30, logTitle: "Cheat Dinner")
        
        saveMeal(mealDescription: "2 medium banana, 200 gr", category: .snack, calorie: 250, mealTimeStamp: twoDaysAgo, protein: 30, carbs: 60, fat: 30, logTitle: "Banana pre-workout")
        
        print("inserted meals..?")
        
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Meal.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )

    let today = Date()
    let yesterday = Calendar.current.date(
        byAdding: .day,
        value: -1,
        to: today
    )!
    let twoDaysAgo = Calendar.current.date(
        byAdding: .day,
        value: -2,
        to: today
    )!

    container.mainContext.insert(
        Meal(
            mealDescription: "Chicken breast 200g",
            category: .breakfast,
            calorie: 250,
            mealTimeStamp: today,
            protein: 40,
            carbs: 5,
            fat: 5,
            logTitle: "Chicken breast"
        )
    )

    container.mainContext.insert(
        Meal(
            mealDescription: "Eggs and rice",
            category: .lunch,
            calorie: 500,
            mealTimeStamp: today,
            protein: 30,
            carbs: 60,
            fat: 15,
            logTitle: "Eggs + Rice"
        )
    )

    container.mainContext.insert(
        Meal(
            mealDescription: "Fish and vegetables",
            category: .dinner,
            calorie: 400,
            mealTimeStamp: yesterday,
            protein: 45,
            carbs: 20,
            fat: 10,
            logTitle: "Fish Dinner"
        )
    )

    container.mainContext.insert(
        Meal(
            mealDescription: "Banana and yogurt",
            category: .snack,
            calorie: 250,
            mealTimeStamp: twoDaysAgo,
            protein: 10,
            carbs: 40,
            fat: 5,
            logTitle: "Pre-workout Snack"
        )
    )

    return MealLogView()
        .modelContainer(container)
}
