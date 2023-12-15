//
//  ContentView.swift
//  Navigation
//
//  Created by Kevin Pfefferle on 12/15/23.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailView(number: 566)
            }
        }
    }
}

#Preview {
    ContentView()
}
