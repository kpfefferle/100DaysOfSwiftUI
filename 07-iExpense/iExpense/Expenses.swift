//
//  Expenses.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/10/23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}
