//
//  User.swift
//  SwiftDataProject
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now

    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
    
    var unwrappedJobs: [Job] {
        jobs ?? []
    }
}
