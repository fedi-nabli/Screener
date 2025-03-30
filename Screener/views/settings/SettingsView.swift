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
            
            MenubarSettingsView()
                .tabItem { Label("Menubar Extra", systemImage: "rectangle.topthird.inset.filled") }
        }
        .frame(minWidth: 400, minHeight: 300)
    }
}

#Preview {
    SettingsView()
}
