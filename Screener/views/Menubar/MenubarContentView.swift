//
//  MenubarContentView.swift
//  Screener
//
//  Created by Fedi Nabli on 30/3/2025.
//

import SwiftUI

struct MenubarContentView: View {
    @ObservedObject var vm: ScreencaptureViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 100))]) {
                    ForEach(vm.images, id: \.self) {
                        image in Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .onDrag({NSItemProvider(object: image)})
                            // .draggable(image)
                    }
                }
            }
            .contentMargins(20)
            .frame(maxHeight: 200)
            
            HStack {
                Button(action: {
                    vm.takeScreenshot(for: .area)
                }, label: {
                    Label("Make an area screenshot", systemImage: "rectangle.center.inset.filled.badge.plus")
                })
                
                Button(action: {
                    vm.takeScreenshot(for: .window)
                }, label: {
                    Label("Make a window screenshot", systemImage: "macwindow")
                })
                
                Button(action: {
                    vm.takeScreenshot(for: .full)
                }, label: {
                    Label("Make a full screenshot", systemImage: "macbook.gen2")
                })
            }
            .labelStyle(.iconOnly)
        }
        .padding()
    }
}

#Preview {
    MenubarContentView(vm: ScreencaptureViewModel())
}
