//
//  ContentView.swift
//  FriendFace
//
//  Created by Kevin Pfefferle on 12/20/23.
//

import SwiftUI

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
