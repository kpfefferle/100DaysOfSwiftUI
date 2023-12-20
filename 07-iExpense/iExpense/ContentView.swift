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
    @State private var typeFilter = "All"
    
    var body: some View {
        NavigationStack {
            ItemsView(sortOrder: sortOrder, typeFilter: typeFilter)
                .navigationTitle("iExpense")
                .toolbar {
                    Menu("Filter") {
                        Picker("Filter", selection: $typeFilter) {
                            Text("Show All")
                                .tag("All")
                            Text("Show Personal")
                                .tag("Personal")
                            Text("Show Business")
                                .tag("Business")
                        }
                    }
                    
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
