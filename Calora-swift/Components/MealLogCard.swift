//
//  MealLogCard.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 21/08/26.
//

import Foundation
import SwiftUI

struct MealLogCard: View {
    
    let category: String
    let title: String
    let protein: Int
    let carbs: Int
    let fat: Int
    let calories: Int
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text("\(category)").bold(true)
                Text("\(title)")
                Text("protein: \(protein) g | carbs: \(carbs) g | fat: \(fat) g")
                    .font(.caption)
            }.padding(.leading, 20)
                .padding(.top, 10)
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("\(Date().formatted(date: .numeric, time: .shortened))")
                    .font(.caption)
                Text("\(calories) cals")
            }.padding(.trailing, 20)
                .padding(.top, 10)
        }
    }
    
}
