//
//  ContentView.swift
//  Instafilter
//
//  Created by Kevin Pfefferle on 12/21/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift")
    }
}

#Preview {
    ContentView()
}
