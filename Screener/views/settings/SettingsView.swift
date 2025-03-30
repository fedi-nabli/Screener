//
//  SettingsView.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            KeyboardSettingsView()
                .tabItem { Label("Keyboard", systemImage: "keyboard") }
            
            Text("Second Second Second Second Second Second Second")
                .tabItem { Label("Second", systemImage: "gear") }
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
