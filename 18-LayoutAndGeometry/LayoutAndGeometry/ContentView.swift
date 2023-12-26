//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Kevin Pfefferle on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

#Preview {
    ContentView()
}
