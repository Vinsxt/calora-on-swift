//
//  FormField.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI

struct FormField: View {
    
    let title: String
    let placeholder: String
    @Binding var textbind: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(title).font(.subheadline)
            
            TextField(placeholder, text: $textbind)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius:10)
                    .fill(.white))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black.opacity(0.9)))
        }
    }
}
