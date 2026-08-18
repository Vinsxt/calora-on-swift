//
//  UserProfile.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 18/08/26.
//

import Foundation
import SwiftData

@Model
class UserProfile: Identifiable {
    
    var id: String
    var name: String
    var birthdate: Date
    var height: Int?
    var weight: Int?
    var selectedGender: String?
    var selectedGoal: String?
    
    init (name: String, birthdate: Date, height: Int?, weight: Int?, selectedGender: String?, selectedGoal: String?){
        id = UUID().uuidString
        self.name = name
        self.birthdate = birthdate
        self.height = height
        self.weight = weight
        self.selectedGender = selectedGender
        self.selectedGoal = selectedGoal
    }
}
