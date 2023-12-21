//
//  ContentView.swift
//  FriendFace
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import SwiftUI

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

struct DetailView: View {
    let user: User
    
    var body: some View {
        List(user.friends) { friend in
            Text(friend.name)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Text(user.isActive ? "Active" : "Inactive")
                            .fontWeight(.black)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(user.isActive ? .green : .gray)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        if users.count > 0 {
            return
        }

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
