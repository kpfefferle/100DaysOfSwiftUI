//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
