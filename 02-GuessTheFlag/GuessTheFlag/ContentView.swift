//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kevin Pfefferle on 12/2/23.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    var opacityAmount: Double
    var rotateAmount: Double
    var scaleAmount: Double
    
    var body: some View {
        Image(image)
            .clipShape(.capsule)
            .shadow(radius: 5)
            .opacity(opacityAmount)
            .scaleEffect(scaleAmount)
            .rotation3DEffect(.degrees(rotateAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView: View {
    private let gameLength = 8
    
    @State private var answerCount = 0
    @State private var score = 0

    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US",
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedFlag = -1

    @State private var scoreMessage = ""
    @State private var scoreTitle = ""
    @State private var showingScore = false

    @State private var showingGameOver = false

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(
                                image: countries[number],
                                opacityAmount: ((selectedFlag == -1 || number == selectedFlag) ? 1.0 : 0.25),
                                rotateAmount: (number == selectedFlag ? 360.0 : 0.0),
                                scaleAmount: ((selectedFlag == -1 || number == selectedFlag) ? 1.0 : 0.8)
                            )
                        }
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
        .alert("Game Over", isPresented: $showingGameOver) {
            Button("New Game", action: resetGame)
        } message: {
            Text("Your score was \(score) of \(gameLength)")
        }
    }
    
    func askQuestion() {
        selectedFlag = -1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        withAnimation {
            selectedFlag = number
        }
        answerCount += 1

        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That is the flag of \(countries[number])"
        }
        
        if answerCount >= gameLength {
            showingGameOver = true
        } else {
            showingScore = true
        }
    }
        
    func resetGame() {
        answerCount = 0
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
