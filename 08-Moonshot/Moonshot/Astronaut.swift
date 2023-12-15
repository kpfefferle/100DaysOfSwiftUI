//
//  Astronaut.swift
//  Moonshot
//
//  Created by Kevin Pfefferle on 12/12/23.
//

import Foundation

struct Astronaut: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let description: String
}
