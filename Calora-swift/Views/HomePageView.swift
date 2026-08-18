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
        Text("Hello, \(profiles.first?.name ?? "Unknown")")
        Text("Weight: \(profiles.first?.weight ?? 0)")
        Text("Height: \(profiles.first?.height ?? 0)")
        Text("Gender: \(profiles.first?.selectedGender ?? "Not specified")")
    }
}

#Preview {
    NavigationStack{
        HomePageView()
    }
}
