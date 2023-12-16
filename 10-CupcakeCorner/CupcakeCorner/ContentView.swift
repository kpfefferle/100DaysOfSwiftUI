//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Kevin Pfefferle on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
    }
}

#Preview {
    ContentView()
}
