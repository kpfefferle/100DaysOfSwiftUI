//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kevin Pfefferle on 12/3/23.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}

#Preview {
    ContentView()
}
