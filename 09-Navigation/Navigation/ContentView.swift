//
//  ContentView.swift
//  Navigation
//
//  Created by Kevin Pfefferle on 12/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path.append(32)
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path.append(32)
                    path.append(64)
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
