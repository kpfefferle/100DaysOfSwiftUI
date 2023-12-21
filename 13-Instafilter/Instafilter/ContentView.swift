//
//  ContentView.swift
//  Instafilter
//
//  Created by Kevin Pfefferle on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ShareLink(
            item: URL(string: "https://www.hackingwithswift.com")!,
            subject: Text("Learn Swift here"),
            message: Text("Check out the 100 Days of SwiftUI!")
        )
    }
}

#Preview {
    ContentView()
}
