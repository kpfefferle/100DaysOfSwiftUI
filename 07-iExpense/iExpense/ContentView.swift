//
//  ContentView.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/9/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ItemsView()
                .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink {
                        AddView()
                    } label: {
                        Image(systemName: "plus")
                            .accessibilityLabel("Add new expense")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
