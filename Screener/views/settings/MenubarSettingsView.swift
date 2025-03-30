//
//  MenubarSettingsView.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI

struct MenubarSettingsView: View {
    @AppStorage("menuBarExtraIsInserted") var menuBarExtraIsInserted: Bool = true
    
    var body: some View {
        Form {
            Toggle("Show menu bar extra", isOn: $menuBarExtraIsInserted)
        }
        .padding()
    }
}

#Preview {
    MenubarSettingsView()
}
