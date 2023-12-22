//
//  Location.swift
//  BucketList
//
//  Created by Kevin Pfefferle on 12/22/23.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
