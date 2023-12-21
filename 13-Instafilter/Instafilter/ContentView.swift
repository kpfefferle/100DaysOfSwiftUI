//
//  ContentView.swift
//  Instafilter
//
//  Created by Kevin Pfefferle on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    let example = Image(.mystery)
    
    var body: some View {
        ShareLink(item: example, preview: SharePreview("Mystery", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}
