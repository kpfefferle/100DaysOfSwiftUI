//
//  ItemsView.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import SwiftData
import SwiftUI

struct ItemView: View {
    var item: ExpenseItem
    
    var formattedAmount: String {
        item.amount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
                   
            Spacer()
            Text(formattedAmount)
                .foregroundStyle(colorFor(amount: item.amount))
        }
        .accessibilityElement()
        .accessibilityLabel("\(item.name), \(formattedAmount)")
        .accessibilityHint(item.type)
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

struct ItemsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var items: [ExpenseItem]

    var body: some View {
        List {
            ForEach(items) { item in
                ItemView(item: item)
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(sortOrder: [SortDescriptor<ExpenseItem>], typeFilter: String) {
        _items = Query(filter: #Predicate<ExpenseItem> { item in
            if typeFilter == "All" {
                return true
            } else {
                return item.type == typeFilter
            }
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ItemsView(sortOrder: [SortDescriptor(\ExpenseItem.name)], typeFilter: "All")
        .modelContainer(for: ExpenseItem.self)
}
