//
//  ContentView.swift
//  WeSplit
//
//  Created by Kevin Pfefferle on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

#Preview {
    ContentView()
}
