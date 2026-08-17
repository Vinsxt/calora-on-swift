//
//  OnboardingView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var name = ""
    @State private var birthdate: Date = Date()
    @State private var height: Int? = nil
    @State private var weight: Int? = nil
    @State private var selectedGender: String? = nil
    @State private var selectedGoal: String? = nil
    
    var body: some View {
        
        Text("Let's get to know you first!")
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .font(.headline)
        
        VStack(){
            FormField(title: "Name", placeholder: "Enter your name", textbind: $name)
                .padding(.bottom)
            
            VStack(alignment: .leading){
                Text("Gender").font(.subheadline)
                
                Picker("Gender", selection: $selectedGender, content: {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                })
                .pickerStyle(.segmented)
            }.padding(.bottom)
            
            FormDatePicker(title: "Birth date", placeholder: "Select your birth date", datebind: $birthdate)
                .padding(.bottom)
            
            HStack(spacing: 12){
                FormNumberField(value: $height, title: "Body Height", placeholder: "Height (cm)")
                FormNumberField(value: $weight, title: "Body Weight", placeholder: "Weight (kg)")
            }
            .padding(.bottom)
            
            VStack(alignment: .leading){
                Text("Current Goal").font(.subheadline)
                
                Picker("Select your goal", selection: $selectedGoal) {
                    Text("Lose fat").tag("lose")
                    Text("Build muscle").tag("build")
                    Text("Maintain weight").tag("maintain")
                }
                .pickerStyle(.navigationLink)
                
                
                
        
                
            }.padding(.bottom)
            
        }.padding(.horizontal, 35)
     
    }
}

#Preview {
    NavigationStack{
        OnboardingView()
    }
}
