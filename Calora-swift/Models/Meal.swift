//
//  Meal.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 22/08/26.
//

import Foundation
import SwiftData

@Model
class Meal: Identifiable {
    
    var id: String
    var mealDescription: String
    var calorie: Int?
    var mealTimeStamp: Date
    var protein: Int?
    var carbs: Int?
    var fat: Int?
    var logTitle: String
    
    init(mealDescription: String, calorie: Int? = nil, mealTimeStamp: Date, protein: Int? = nil, carbs: Int? = nil, fat: Int? = nil, logTitle: String) {
        id = UUID().uuidString
        self.mealDescription = mealDescription
        self.calorie = calorie
        self.mealTimeStamp = mealTimeStamp
        self.protein = protein
        self.carbs = carbs
        self.fat = fat
        self.logTitle = logTitle
    }
}
