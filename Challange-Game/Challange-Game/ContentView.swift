//
//  ContentView.swift
//  Challenge game
//
//  Created by Mahmoud Fouad on 6/4/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: -  property wrappers
    @State private var moves = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var moveIndex = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var userChoice = 0
    @State private var score = 0
    @State private var isAlertShwon = false
    @State private var resultStr = ""
    
    //MARK: - Body
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                
                Text("The move is \(moves[moveIndex])")
                    .titleStyle(font: .title)
                
                Text("Choose to \(shouldWin ? "Win" : "Lose")")
                    .titleStyle(font: .title2)

                ForEach(0..<moves.count, id: \.self) { index in
                    Button(action: {
                        choiceTapped(index)
                    }, label: {
                        Text(moves[index])
                    })
                    .buttonStyle()
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                Spacer()
                
                Text("Score: \(score)")
                    .titleStyle(font: .body)
                Spacer()
            }.alert(isPresented: $isAlertShwon) {
                Alert(title: Text("Result"),
                      message: Text(resultStr), dismissButton: .default(Text("Ok")){
                        playAgain()
                      })
            }
        }
    }
    
    //MARK:- Intent
    private func choiceTapped(_ index: Int) {
        let result = checkResult(move: moves[moveIndex], choice: moves[index])
        resultStr =  result ? "Congratulations" : "Sorry, try again!"
        calculateScore(result)
        isAlertShwon.toggle()
    }
    
    private func playAgain() {
        moves.shuffle()
        moveIndex = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    private func checkResult(move: String, choice: String) -> Bool {
        var result = false
        guard move != choice else {
            return false
        }
        if move == "Scissors" && choice == "Rock" {
            result = true
        } else if move == "Paper" && choice == "Scissors" {
            result = true
        } else if move == "Rock" && choice == "Paper" {
            result = true
        } else {
            result = false
        }
        return shouldWin == result
    }
    
    private func calculateScore(_ status: Bool) {
        if score == 0, !status  {
            return
        }
        score += status ?  10 :  -10
    }
}

extension View {
    func titleStyle(font: Font) -> some View {
        self.modifier(Title(font: font))
    }
    
    func buttonStyle() -> some View {
        self.modifier(Buttons())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
