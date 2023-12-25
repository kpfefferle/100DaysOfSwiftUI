//
//  ContentView.swift
//  Flashzilla
//
//  Created by Kevin Pfefferle on 12/24/23.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                print("The time is now \(time)")
            }
    }
}

#Preview {
    ContentView()
}
