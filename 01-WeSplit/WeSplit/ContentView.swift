//
//  ContentView.swift
//  WeSplit
//
//  Created by Kevin Pfefferle on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
