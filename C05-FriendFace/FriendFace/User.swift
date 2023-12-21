//
//  User.swift
//  FriendFace
//
//  Created by Kevin Pfefferle on 12/21/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date

    let tags: [String]
    let friends: [Friend]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        let registeredString = try container.decode(String.self, forKey: .registered)
        if let registeredDate = try? Date(registeredString, strategy: .iso8601) {
            self.registered = registeredDate
        } else {
            self.registered = .now
        }
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
}
