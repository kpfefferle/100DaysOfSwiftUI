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
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ItemsView()
        .modelContainer(for: ExpenseItem.self)
}
