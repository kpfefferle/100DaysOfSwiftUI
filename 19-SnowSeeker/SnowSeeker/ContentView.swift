//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Kevin Pfefferle on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
        }
    }
}

#Preview {
    ContentView()
}
