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
    let mealTimeStamp: Date
    
    let onTap: () -> Void
    
    var body: some View {
        
        Button {
            onTap()
        } label: {
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Text("\(category)").bold(true)
                        Text("\(title)")
                        
                    }.padding(.leading, 20)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("\(mealTimeStamp.formatted(date: .numeric, time: .shortened))")
                            .font(.caption)
                        Text("\(calories) cals")
                    }.padding(.trailing, 20)
                        .padding(.top, 10)
                }
                Text("protein: \(protein) g | carbs: \(carbs) g | fat: \(fat) g")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
            }
        }
        .buttonStyle(.plain)
        
        
    }
}

#Preview {
    MealLogCard(category: "Breakfast", title: "Chicken breast 200g", protein: 40, carbs: 5, fat: 5, calories: 250, mealTimeStamp: Date())
    {
        print("hello")
    }
}
