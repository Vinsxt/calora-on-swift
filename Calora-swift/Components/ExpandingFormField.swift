//
//  ExpandingFormField.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 23/08/26.
//

import Foundation
import SwiftUI

struct ExpandingFormField: View {
    
    let title: String
    let placeholder: String
    @Binding var textbind: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(title).font(.subheadline)
            
            TextField(placeholder, text: $textbind, axis: .vertical)
                .lineLimit(1...7)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius:10)
                    .fill(.white))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black.opacity(0.9)))
        }
    }
}
