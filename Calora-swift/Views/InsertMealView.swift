//
//  InsertMealView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 21/08/26.
//

import SwiftUI
import SwiftData

struct InsertMealView: View {
    
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
    
    var body: some View {
        
        VStack(spacing: 16){
            Text("Describe your meal today")
                .font(.title3)
                .bold(true)
            
            ExpandingFormField(title: "Meal description", placeholder: "Describe your meal detail..", textbind: $mealDescription)
                .padding(.bottom)
            
            Text("or tell the app manually:")
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
                    saveMeal(mealDescription: mealDescription, category: category, calorie: calorie, mealTimeStamp: Date(), protein: protein, carbs: carbs, fat: fat, logTitle: logTitle)
                    
                    dismiss()
                }
                
            }) {
                Text("Save Meal").tint(.white)
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
}



#Preview {
    NavigationStack{
        InsertMealView()
    }
}
