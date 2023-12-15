//
//  ContentView.swift
//  Navigation
//
//  Created by Kevin Pfefferle on 12/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
        }
    }
}

#Preview {
    ContentView()
}
