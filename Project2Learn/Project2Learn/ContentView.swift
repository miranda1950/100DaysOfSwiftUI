//
//  ContentView.swift
//  Project2Learn
//
//  Created by COBE on 07.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var endGame = false
    @State private var scoreTitle = ""
    @State var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var score = 0
    @State private var questionsAsked = 0
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
        VStack(spacing: 15) {
        VStack {
            Text("Tap the flag of")
                .foregroundStyle(.secondary)
                .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
                
                .font(.largeTitle.weight(.semibold))
            
        }
        ForEach(0..<3) {
            number in
            Button {
                flagTapped(number)
            } label: {
                Image(countries[number])
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .shadow(radius: 5)
            }
        }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        Spacer()
        Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
        Spacer()
            } .blueTitle()
            .padding()
    }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
            
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, thats the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionsAsked += 1
    } 
    
    
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .scaleEffect(1.2)
    }
}

extension View {
    func blueTitle() -> some View {
        self.modifier(TitleText())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}