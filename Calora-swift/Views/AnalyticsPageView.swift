//
//  AnalyticsPageView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 22/08/26.
//

import SwiftUI

struct AnalyticsPageView: View {
    var body: some View {
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                AnalyticsNumbersCard()
                
                AnalyticsNumbersCard()
            }
            .padding(.horizontal)
        }
        
        
    }
}

#Preview {
    AnalyticsPageView()
}
