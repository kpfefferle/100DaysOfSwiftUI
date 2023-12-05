//
//  ContentView.swift
//  RPSTrainer
//
//  Created by Kevin Pfefferle on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    let gameLength = 10
    
    @State var moves = ["✊🏻", "✋🏻", "✌🏻"].shuffled()
    @State var opponentMoveIndex = Int.random(in: 0...2)
    @State var userShouldWin = Bool.random()
    
    @State var showingScore = false
    @State var score = 0
    @State var scoreTitle = ""
    @State var scoreMessage = ""
    
    @State var answerCount = 0
    @State var showingGameOver = false
    
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
        .alert("Game Over", isPresented: $showingGameOver) {
            Button("New Game", action: newGame)
        } message: {
            Text("You scored \(score) out of \(gameLength)")
        }
    }
    
    private func checkMove(_ chosenMove: String) {
        let correctMove = userShouldWin ? winningMove : losingMove
        
        if chosenMove == correctMove {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "The correct move was \(correctMove)"
        }
        
        answerCount += 1
        if (answerCount < gameLength) {
            showingScore = true
        } else {
            showingGameOver = true
        }
    }
    
    private func nextMove() {
        moves.shuffle()
        opponentMoveIndex = Int.random(in: 0...2)
        userShouldWin.toggle()
    }
    
    private func newGame() {
        answerCount = 0
        score = 0
        nextMove()
    }
}

#Preview {
    ContentView()
}
