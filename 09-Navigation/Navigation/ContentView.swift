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
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }
                    }

                    ToolbarItem(placement: .topBarLeading) {
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
