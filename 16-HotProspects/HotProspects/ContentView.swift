//
//  ContentView.swift
//  HotProspects
//
//  Created by Kevin Pfefferle on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("One", systemImage: "star")
                }
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
