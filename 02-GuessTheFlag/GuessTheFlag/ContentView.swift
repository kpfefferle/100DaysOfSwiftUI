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
            LinearGradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
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
