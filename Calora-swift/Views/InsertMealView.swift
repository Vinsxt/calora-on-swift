//
//  InsertMealView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 21/08/26.
//

import SwiftUI

struct InsertMealView: View {
    
    @State private var mealDescription: String = ""
    
    var body: some View {
        
        VStack{
            Text("Describe your meal today")
                .font(.title3)
                .bold(true)
                .padding(.bottom, 20)

        }
        .padding(.horizontal, 50)
        
        VStack(alignment: .leading){
            
            ExpandingFormField(title: "Meal description", placeholder: "Describe your meal detail..", textbind: $mealDescription)

        }
        .padding(.horizontal, 40)
        
        
    }
}

#Preview {
    InsertMealView()
}
