//
//  ContentView.swift
//  Animations
//
//  Created by Kevin Pfefferle on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .padding(50)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .animation(.default, value: enabled)
    }
}

#Preview {
    ContentView()
}
