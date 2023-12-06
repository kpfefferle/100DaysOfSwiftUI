//
//  ContentView.swift
//  Animations
//
//  Created by Kevin Pfefferle on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(
            .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true),
            value: animationAmount
        )
    }
}

#Preview {
    ContentView()
}
