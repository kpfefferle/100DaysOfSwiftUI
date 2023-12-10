//
//  ContentView.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/9/23.
//

import SwiftUI

struct ItemView: View {
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
                   
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(colorFor(amount: item.amount))
        }
    }
    
    func colorFor(amount: Double) -> any ShapeStyle {
        if amount < 10 {
            return .green
        }
        if amount < 100 {
            return .yellow
        }
        return .red
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()

    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            ItemView(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }

                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ItemView(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
