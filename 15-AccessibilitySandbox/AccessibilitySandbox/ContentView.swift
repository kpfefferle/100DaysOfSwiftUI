//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Kevin Pfefferle on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    ContentView()
}
