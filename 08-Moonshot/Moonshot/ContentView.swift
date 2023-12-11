//
//  ContentView.swift
//  Moonshot
//
//  Created by Kevin Pfefferle on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.apollo11)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
