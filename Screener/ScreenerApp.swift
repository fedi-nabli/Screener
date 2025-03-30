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
    @AppStorage("menuBarExtraIsInserted") var menuBarExtraIsInserted: Bool = true
    
    var body: some Scene {
        Window("Screener", id: "main", content: {
            ContentView(vm: vm)
        })
        
        MenuBarExtra("Screener", systemImage: "photo.badge.plus", isInserted: $menuBarExtraIsInserted) {
            MenubarContentView(vm: vm)
        }
        .menuBarExtraStyle(.window)
        
        Settings {
            SettingsView()
        }
    }
}
