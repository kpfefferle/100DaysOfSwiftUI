//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Kevin Pfefferle on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Live long and prosper")
            .offset(x: 20, y: 20)
            .frame(width: 300, height: 300, alignment: .topLeading)
            .background(.gray)
    }
}

#Preview {
    ContentView()
}
