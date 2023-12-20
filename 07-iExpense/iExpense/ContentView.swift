//
//  ContentView.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/9/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    
    var body: some View {
        NavigationStack {
            ItemsView(sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount),
                                ])
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name),
                                ])
                        }
                    }
                    
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
