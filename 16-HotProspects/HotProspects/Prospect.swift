//
//  Prospect.swift
//  HotProspects
//
//  Created by Kevin Pfefferle on 12/24/23.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor
@Observable
class Prospects: ObservableObject {
    var people: [Prospect]
    
    init() {
        self.people = []
    }
}
