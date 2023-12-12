//
//  ContentView.swift
//  Moonshot
//
//  Created by Kevin Pfefferle on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
