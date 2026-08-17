//
//  FormNumberField.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import Foundation
import SwiftUI

struct FormNumberField: View {
    @Binding var value: Int?
    let title: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(title).font(.subheadline)
            
            TextField(placeholder, value: $value, format: .number)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius:10)
                    .fill(.white))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black.opacity(0.9)))
        }
    }
}
