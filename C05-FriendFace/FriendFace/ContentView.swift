//
//  ContentView.swift
//  FriendFace
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import SwiftUI

struct User: Identifiable, Codable {
    let id: String
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
        self.id = try container.decode(String.self, forKey: .id)
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
}

struct Friend: Identifiable, Codable {
    let id: String
    let name: String
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        Text("Users: \(users.count)")
            .task {
                await loadData()
            }
    }
    
    func loadData() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
