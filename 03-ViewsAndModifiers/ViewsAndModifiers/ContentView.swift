//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kevin Pfefferle on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, world!") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}

#Preview {
    ContentView()
}
