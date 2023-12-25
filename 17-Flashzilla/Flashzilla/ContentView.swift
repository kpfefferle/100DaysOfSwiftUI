//
//  ContentView.swift
//  Flashzilla
//
//  Created by Kevin Pfefferle on 12/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
    }
}

#Preview {
    ContentView()
}
