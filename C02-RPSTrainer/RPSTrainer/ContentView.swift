//
//  ContentView.swift
//  RPSTrainer
//
//  Created by Kevin Pfefferle on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊🏻", "✋🏻", "✌🏻"].shuffled()
    @State var opponentMove = Int.random(in: 0...2)
    @State var userShouldWin = Bool.random()
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                Spacer()

                Text("Your opponent's move is")
                Text(moves[opponentMove])
                    .font(.system(size: 100))

                Spacer()
                
                Text("What is your move to...")
                Text("\(userShouldWin ? "Win" : "Lose")?")
                    .font(.title.bold())
                
                ForEach(moves, id: \.self) { move in
                    Button {
                        // check answer
                    } label: {
                        Text(move)
                            .font(.system(size: 100))
                    }
                }

                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
