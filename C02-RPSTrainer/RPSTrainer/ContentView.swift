//
//  ContentView.swift
//  RPSTrainer
//
//  Created by Kevin Pfefferle on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊🏻", "✋🏻", "✌🏻"].shuffled()
    @State var opponentMoveIndex = Int.random(in: 0...2)
    @State var userShouldWin = Bool.random()
    
    @State var showingScore = false
    @State var score = 0
    @State var scoreTitle = ""
    @State var scoreMessage = ""
    
    var opponentMove: String {
        return moves[opponentMoveIndex]
    }
    
    var winningMove: String {
        switch opponentMove {
        case "✊🏻":
            return "✋🏻"
        case "✋🏻":
            return "✌🏻"
        case "✌🏻":
            return "✊🏻"
        default:
            return ""
        }
    }
    
    var losingMove: String {
        switch opponentMove {
        case "✊🏻":
            return "✌🏻"
        case "✋🏻":
            return "✊🏻"
        case "✌🏻":
            return "✋🏻"
        default:
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                Spacer()

                Text("Your opponent's move is")
                Text(opponentMove)
                    .font(.system(size: 100))

                Spacer()
                
                Text("What is your move to...")
                Text("\(userShouldWin ? "Win" : "Lose")?")
                    .font(.title.bold())
                
                ForEach(moves, id: \.self) { move in
                    Button {
                        checkMove(move)
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
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: nextMove)
        } message: {
            Text(scoreMessage)
        }
    }
    
    func checkMove(_ chosenMove: String) {
        let correctMove = userShouldWin ? winningMove : losingMove
        
        if chosenMove == correctMove {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "The correct move was \(correctMove)"
        }
        
        showingScore = true
    }
    
    func nextMove() {
        // set state for next move
    }
}

#Preview {
    ContentView()
}
