//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showUpcomingOnly = false
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showUpcomingOnly ? .now : .distantPast)
            .navigationTitle("Users")
            .toolbar {
                Button(showUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showUpcomingOnly.toggle()
                }

                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)

                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
