//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Kevin Pfefferle on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Text("Hello, world!")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(.red)
            }
            .background(.green)

            Text("More text")
                .background(.blue)
        }
    }
}

#Preview {
    ContentView()
}
