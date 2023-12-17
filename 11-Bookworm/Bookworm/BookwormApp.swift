//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Kevin Pfefferle on 12/17/23.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        . modelContainer(for: Book.self)
    }
}
