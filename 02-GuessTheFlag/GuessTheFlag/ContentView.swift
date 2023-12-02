//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kevin Pfefferle on 12/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
