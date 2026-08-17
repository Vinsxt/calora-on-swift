//
//  FormDatePicker.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import Foundation
import SwiftUI

struct FormDatePicker: View {
    
    let title: String
    let placeholder: String
    @Binding var datebind: Date
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(title).font(.subheadline)
            
            DatePicker(
                placeholder,
                selection: $datebind,
                displayedComponents: .date
            )
            .foregroundStyle(Color.gray.opacity(0.5))
            .datePickerStyle(.compact)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(RoundedRectangle(cornerRadius:10)
                .fill(.white))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black.opacity(0.9)))
            
        }
        
    }
}
