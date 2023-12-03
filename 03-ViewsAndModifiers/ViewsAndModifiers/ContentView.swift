//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kevin Pfefferle on 12/3/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .modifier(Title())
    }
}

#Preview {
    ContentView()
}
