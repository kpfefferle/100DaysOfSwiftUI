//
//  ContentView.swift
//  HotProspects
//
//  Created by Kevin Pfefferle on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.black)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
