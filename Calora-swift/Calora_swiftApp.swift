//
//  Calora_swiftApp.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 17/08/26.
//

import SwiftUI
import SwiftData

@main
struct Calora_swiftApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                WelcomePageView()
            }
        }
        .modelContainer(for: UserProfile.self)
    }
}
