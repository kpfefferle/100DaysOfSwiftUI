//
//  Expenses.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/10/23.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
