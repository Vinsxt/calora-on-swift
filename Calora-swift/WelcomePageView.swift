//
//  WelcomePageView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.blue)
                Image(systemName: "carrot.fill")
                    .foregroundColor(Color(white: 1))
                    .font(.system(size: 70))
            }
            
            
            Text("Calora").font(.system(size: 40)).fontWeight(.bold).padding(.top)
                .fontDesign(.rounded)
            Text("Systemize your diet precisely").fontWeight(.light)
        }
        
        .padding(70)
        
        VStack{
            Button(action: {
                // move page
            }) {
                Text("Register")
                    .frame(width: 200, height: 35)
                    
            }.buttonStyle(.borderedProminent).tint(.blue)
                .padding(5)
            
            Button(action: {
                // move page
            }) {
                Text("Login")
                    .frame(width: 200, height: 35)
                    
            }.buttonStyle(.bordered).tint(.blue)
        }
    }
}

#Preview {
    WelcomePageView()
}
