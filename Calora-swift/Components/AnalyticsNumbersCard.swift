//
//  AnalyticsNumbersCard.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 26/08/26.
//

import Foundation
import SwiftUI

struct AnalyticsNumbersCard: View {
    
    let title: String
    let iconDisplay: String
    let iconColor: Color
    let value: Int
    
    
    var body: some View {
        ZStack{
            
            Color(uiColor: .systemGray6)
                .cornerRadius(12)
            
            VStack (spacing: 20){
                HStack (alignment: .top){
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(title)")
                            .font(.system(size: 16))
                    }
                    
                    Spacer()
            
                    Image(systemName: "\(iconDisplay)")
                        .foregroundStyle(iconColor)
                }
                
                Text("\(value)")
                    .font(.system(size: 24))
            }
            .padding()
        }
    }
    
}

#Preview {
    AnalyticsNumbersCard(title: "Calories", iconDisplay: "fork.knife.circle", iconColor: .green, value: 3000)
}
