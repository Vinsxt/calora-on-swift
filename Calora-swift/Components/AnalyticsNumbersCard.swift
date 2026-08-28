//
//  AnalyticsNumbersCard.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 26/08/26.
//

import Foundation
import SwiftUI

struct AnalyticsNumbersCard: View {
    
    var body: some View {
        ZStack{
            
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack (spacing: 20){
                HStack (alignment: .top){
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Steps")
                            .font(.system(size: 16))
                        Text("Goal: 10,000")
                            .font(.system(size: 12))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    Image(systemName: "figure.walk")
                        .foregroundStyle(.green)
                }
                
                Text("10,000")
                    .font(.system(size: 24))
            }
            .padding()
        }
    }
    
}

#Preview {
    AnalyticsNumbersCard()
}
