//
//  KeyboardSettingsView.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI
import KeyboardShortcuts

struct KeyboardSettingsView: View {
    var body: some View {
        Form {
            KeyboardShortcuts.Recorder("Screenshot Area:", name: .screenshotCapture)
            KeyboardShortcuts.Recorder("Screenshot Window:", name: .screenshotCaptureWindow)
            KeyboardShortcuts.Recorder("Screenshot Full Scren:", name: .screenshotCaptureFull)
        }
        .padding()
    }
}

#Preview {
    KeyboardSettingsView()
}
