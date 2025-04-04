//
//  ScreencaptureViewModel.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI
import KeyboardShortcuts

class ScreencaptureViewModel: ObservableObject {
    
    enum ScreenshotTypes {
        case full
        case window
        case area
        
        var processArguments: [String] {
            switch self {
                case .full:
                    ["-c"]
                case .window:
                    ["-cw"]
                case .area:
                    ["-cs"]
            }
        }
    }
    
    @Published var images = [NSImage]()
    
    init() {
        KeyboardShortcuts.onKeyUp(for: .screenshotCapture) { [self] in
            self.takeScreenshot(for: .area)
        }
        KeyboardShortcuts.onKeyUp(for: .screenshotCaptureFull) { [self] in
            self.takeScreenshot(for: .full)
        }
        KeyboardShortcuts.onKeyUp(for: .screenshotCaptureWindow) { [self] in
            self.takeScreenshot(for: .window)
        }
    }
    
    func takeScreenshot(for type: ScreenshotTypes) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = type.processArguments
        
        do {
            try task.run()
            task.waitUntilExit()
            getImageFromPasteboard()
        } catch {
            print("could not take screenshot: \(error)")
        }
    }
    
    private func getImageFromPasteboard() {
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else { return }
        
        guard let image = NSImage(pasteboard: NSPasteboard.general) else { return }
        
        self.images.append(image)
    }
}
