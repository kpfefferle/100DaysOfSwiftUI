//
//  ContentView.swift
//  Moonshot
//
//  Created by Kevin Pfefferle on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
