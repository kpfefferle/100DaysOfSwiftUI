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
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }

                        Button("Or Tap Me") {
                            // button action here
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
