//
//  HomePageDailyStatusCard.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 18/08/26.
//

import Foundation
import SwiftUI

struct HomePageDailyStatusCard: View {
    
    let title: String
    let value: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .frame(maxHeight: 70)
            
            VStack{
                Text(title)
                    .font(.headline)
                    .bold(false)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.white)
                
                Text(value)
                    .font(.subheadline)
                    .bold(false)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundStyle(.white)
            }.padding(.horizontal, 10)
        }
    }
}
