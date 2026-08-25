//
//  EditMealView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 24/08/26.
//

import SwiftUI
import SwiftData

struct EditMealView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query private var profiles: [UserProfile]
    @Query private var meals: [Meal]
    
    // model prototype for meal input:
    @State private var mealDescription: String = ""
    @State private var category: Category? = nil
    @State private var calorie: Int? = nil
    @State private var mealTimeStamp: Date = Date()
    @State private var protein: Int? = nil
    @State private var carbs: Int? = nil
    @State private var fat: Int? = nil
    @State private var logTitle: String = ""
    
    @State private var showIncompleteAlert = false
    
    let passedMeal: Meal
    
    init(passedMeal: Meal){
        
        self.passedMeal = passedMeal
        self._mealDescription = State(initialValue: passedMeal.mealDescription)
        self._logTitle = State(initialValue: passedMeal.logTitle)
        self._category = State(initialValue: passedMeal.category)
        self._calorie = State(initialValue: passedMeal.calorie)
        self._protein = State(initialValue: passedMeal.protein)
        self._carbs = State(initialValue: passedMeal.carbs)
        self._fat = State(initialValue: passedMeal.fat)
    }
    
    var body: some View {
        
        VStack(spacing: 16){
            Text("Edit this meal")
                .font(.title3)
                .bold(true)
            
            ExpandingFormField(title: "Meal description", placeholder: "Describe your meal detail..", textbind: $mealDescription)
                .padding(.bottom)
            
            Text("correct the details if they miss:")
                .font(.subheadline)
            
            
            FormField(title: "Meal title", placeholder: "Name this meal..", textbind: $logTitle)
            
            VStack(alignment: .leading){
                Text("Meal Category").font(.subheadline)
                
                Picker("Select meal type..", selection: $category) {
                    Text("Breakfast").tag(Category.breakfast)
                    Text("Lunch").tag(Category.lunch)
                    Text("Dinner").tag(Category.dinner)
                    Text("Snack").tag(Category.snack)
                }
                .pickerStyle(.navigationLink)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius:10)
                    .fill(.white))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black.opacity(0.9)))
            }
            
            HStack(spacing: 12){
                FormNumberField(value: $calorie, title: "Calories", placeholder: "Meal (kkal)")
                FormNumberField(value: $protein, title: "Protein", placeholder: "Protein (g)")
            }
            
            HStack(spacing: 12){
                FormNumberField(value: $carbs, title: "Carbs", placeholder: "Carbs (g)")
                FormNumberField(value: $fat, title: "Fat", placeholder: "Fat (g)")
            }
            
            Button(action: {
                
                if (mealDescription.isEmpty || category == nil || calorie == nil || protein == nil || carbs == nil || fat == nil || logTitle.isEmpty) {
                    
                    showIncompleteAlert = true
                }
                else{
                    updateMeal(updatingMeal: passedMeal, mealDescription: mealDescription, category: category, calorie: calorie, protein: protein, carbs: carbs, fat: fat, logTitle: logTitle)
                    
                    dismiss()
                }
                
            }) {
                Text("Update Meal").tint(.white)
            }
            .frame(width: 330, height: 40)
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(.black.opacity(0.9)))
            .padding(.top, 40)
            .alert("Incomplete Meal Information", isPresented: $showIncompleteAlert){
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please complete all required meal details before saving.")
            }
        }
        .padding(.horizontal, 40)
        
        
        
        
    }
    
    func saveMeal(mealDescription: String, category: Category? = nil, calorie: Int? = nil, mealTimeStamp: Date, protein: Int? = nil, carbs: Int? = nil, fat: Int? = nil, logTitle: String){
        
        let meal = Meal(mealDescription: mealDescription, category: category, calorie: calorie, mealTimeStamp: mealTimeStamp, protein: protein, carbs: carbs, fat: fat, logTitle: logTitle)
        
        context.insert(meal)
    }
    
    func updateMeal(updatingMeal: Meal, mealDescription: String, category: Category? = nil, calorie: Int? = nil, protein: Int? = nil, carbs: Int? = nil, fat: Int? = nil, logTitle: String){
        
        updatingMeal.mealDescription = mealDescription
        updatingMeal.logTitle = logTitle
        updatingMeal.category = category
        updatingMeal.calorie = calorie
        updatingMeal.protein = protein
        updatingMeal.carbs = carbs
        updatingMeal.fat = fat
        
        do {
            try context.save()
        } catch {
            print("Failed to update meal: \(error)")
        }
    }
}

#Preview {
    NavigationStack{
        EditMealView(
            passedMeal: Meal(
                mealDescription: "Chicken breast 200g",
                category: .breakfast,
                calorie: 250,
                mealTimeStamp: Date(),
                protein: 40,
                carbs: 5,
                fat: 5,
                logTitle: "Chicken breast"
            )
        )
    }
}
