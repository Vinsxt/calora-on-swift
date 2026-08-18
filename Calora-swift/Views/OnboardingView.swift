//
//  OnboardingView.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @State private var showIncompleteAlert = false
    @State private var navigateToHome = false
    
    @State private var name: String = ""
    @State private var birthdate: Date = Date()
    @State private var height: Int? = nil
    @State private var weight: Int? = nil
    @State private var selectedGender: String? = nil
    @State private var selectedGoal: String? = nil
    
    @Environment(\.modelContext) private var context
    @Query private var profiles: [UserProfile]
    
    var body: some View {
        
        VStack (alignment: .center){
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
                }.padding(.bottom, 50)
                
                Button(action: {
                    if (name.isEmpty || birthdate == Date() || height == nil || weight == nil || selectedGender == nil || selectedGoal == nil) {
                        
                        showIncompleteAlert = true
                    }
                    else{
                        saveProfile(name: name, birthdate: birthdate, height: height, weight: weight, selectedGender: selectedGender, selectedGoal: selectedGoal)
                        
                        print("""
                        Profile is saved:
                        Name: \(name)
                        Birthdate: \(birthdate)
                        Height: \(height ?? 0)
                        Weight: \(weight ?? 0)
                        Gender: \(selectedGender ?? "Not Selected")
                        Goal: \(selectedGoal ?? "Not Selected")
                        """)
                        
                        navigateToHome = true
                    }
                
                }) {
                    Text("Continue").tint(.white)
                }
                .frame(width: 330, height: 40)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(.black.opacity(0.9)))
                .alert("Incomplete Information", isPresented: $showIncompleteAlert){
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Please complete all required fields before continuing.")
                }
                .navigationDestination(isPresented: $navigateToHome){
                    HomePageView()
                }
                
            }.padding(.horizontal, 35)
            
            Spacer()

        }
             
    }
    
    func saveProfile(name: String, birthdate: Date, height: Int?, weight: Int?, selectedGender: String?, selectedGoal: String?){
        
        if let profile = profiles.first{
            profile.name = name
            profile.birthdate = birthdate
            profile.height = height
            profile.weight = weight
            profile.selectedGender = selectedGender
            profile.selectedGoal = selectedGoal
        }
        else{
            let profile = UserProfile(name: name, birthdate: birthdate, height: height, weight: weight, selectedGender: selectedGender, selectedGoal: selectedGoal)
            context.insert(profile)
        }
        
        
    }
}

#Preview {
    NavigationStack{
        OnboardingView()
    }
}
