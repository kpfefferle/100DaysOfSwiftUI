//
//  ContentView.swift
//  Flashzilla
//
//  Created by Kevin Pfefferle on 12/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onLongPressGesture {
                print("Long pressed!")
            }
    }
}

#Preview {
    ContentView()
}
