//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kevin Pfefferle on 12/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
