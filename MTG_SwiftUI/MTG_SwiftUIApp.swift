//
//  MTG_SwiftUIApp.swift
//  MTG_SwiftUI
//
//  Created by Maxim Mitin on 25.12.22.
//

import SwiftUI

@main
struct MTG_SwiftUIApp: App {
    @StateObject var dataManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
