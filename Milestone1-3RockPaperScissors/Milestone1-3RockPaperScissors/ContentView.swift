//
//  ContentView.swift
//  Milestone1-3RockPaperScissors
//
//  Created by COBE on 08.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    let values = ["Rock", "Paper", "Scissors"]
    
    @State var choosedValue = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var score = 0
    
    var body: some View {
        Form {
            Section {
                Text(values[choosedValue])
                Text(String(shouldWin) == "true" ? "win" : "lose")
            }  header: {
                Text ("I choose...")
            }
            
                Button("Rock") {
                    if values[choosedValue] == "Paper" && shouldWin {
                        score -= 1
                        print("i lose")
                    } else if values[choosedValue] == "Paper" && !shouldWin {
                        score += 1
                        print("i win")
                    }
                    else if values[choosedValue] == "Scissors" && shouldWin{
                        score += 1
                        print("i win")
                    } else if values[choosedValue] == "Scissors" && !shouldWin {
                        score -= 1
                        print("i lose")
                    }
                    else if values[choosedValue] == "Rock" {
                        score -= 5
                    }
                    anotherOne()
                    
                }
                Button("Scissors") {
                    if values[choosedValue] == "Paper" && shouldWin {
                        score += 1
                        print("i win")
                    } else if values[choosedValue] == "Paper" && !shouldWin {
                        score -= 1
                        print("i lose")
                    }
                    else if values[choosedValue] == "Rock" && shouldWin{
                        score -= 1
                        print("i lose")
                    } else if values[choosedValue] == "Rock" && !shouldWin {
                        score += 1
                        print("i win")
                    }
                    else if values[choosedValue] == "Scissors" {
                        score -= 5
                    }
                    anotherOne()
                }
                
                Button("Paper") {
                    if values[choosedValue] == "Scissors" && shouldWin {
                        score -= 1
                        print("i lose")
                    } else if values[choosedValue] == "Scissors" && !shouldWin {
                        score += 1
                        print("i win")
                    }
                    else if values[choosedValue] == "Rock" && shouldWin{
                        score += 1
                        print("i win")
                    } else if values[choosedValue] == "Rock" && !shouldWin {
                        score -= 1
                        print("i lose")
                    }
                    else if values[choosedValue] == "Paper" {
                        score -= 5
                    }
                    anotherOne()
                }
            
            Text("Score: \(score)" )
            
        }
    }
    
    func anotherOne() {
        values.shuffled()
        choosedValue = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
