//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/9/23.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
