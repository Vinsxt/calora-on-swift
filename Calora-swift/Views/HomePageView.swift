//
//  HomePageView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 18/08/26.
//

import SwiftUI
import SwiftData

struct HomePageView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var profiles: [UserProfile]
    
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Text("Hello, \(profiles.first?.name ?? "Unknown")")
                .frame(maxWidth: .infinity, alignment: .leading)
                
            VStack(spacing: 12){
                
                    HStack(spacing: 12){
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(maxHeight: 70)
                      
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(maxHeight: 70)

                    }.padding(.horizontal, 0.1)
                    
                    HStack(spacing: 12){
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(maxHeight: 70)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .frame(maxHeight: 70)

                    }.padding(.horizontal, 0.1)
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2)))
                    
            
            Text("Weight: \(profiles.first?.weight ?? 0)")
                .font(.title)
                .bold(true)
                
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Height: \(profiles.first?.height ?? 0)")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Gender: \(profiles.first?.selectedGender ?? "Not specified")")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
        }.padding(.horizontal, 35)
            .padding(.top)
        
        
        
        
        
        
    }
}

#Preview {
    NavigationStack{
        HomePageView()
    }
}
