//
//  ContentView.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ScreencaptureViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 300))]) {
                    ForEach(vm.images, id: \.self) {
                        image in Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .onDrag({NSItemProvider(object: image)})
                            // .draggable(image)
                    }
                }
            }
            
            HStack {
                Button("Make an area screenshot") {
                    vm.takeScreenshot(for: .area)
                }
                
                Button("Make a window screenshot") {
                    vm.takeScreenshot(for: .window)
                }
                
                Button("Make a full screenshot") {
                    vm.takeScreenshot(for: .full)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
