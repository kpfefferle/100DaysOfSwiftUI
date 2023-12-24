//
//  ContentView.swift
//  HotProspects
//
//  Created by Kevin Pfefferle on 12/23/23.
//

import SwiftUI

@MainActor @Observable class User: ObservableObject {
    var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

#Preview {
    ContentView()
}
