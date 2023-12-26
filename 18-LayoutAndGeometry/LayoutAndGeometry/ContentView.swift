//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Kevin Pfefferle on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Text("Hello, world!")
                .frame(width: geo.size.width * 0.9)
                .background(.red)
        }
    }
}

#Preview {
    ContentView()
}
