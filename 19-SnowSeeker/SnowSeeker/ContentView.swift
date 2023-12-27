//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Kevin Pfefferle on 12/26/23.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil

    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                selectedUser = User()
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
            }
    }
}

#Preview {
    ContentView()
}
