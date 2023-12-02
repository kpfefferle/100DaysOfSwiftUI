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
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
