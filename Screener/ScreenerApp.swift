//
//  ScreenerApp.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI

@main
struct ScreenerApp: App {
    
    @StateObject var vm = ScreencaptureViewModel()
    
    var body: some Scene {
        Window("Screener", id: "main", content: {
            ContentView(vm: vm)
        })
        
        Settings {
            SettingsView()
        }
    }
}
