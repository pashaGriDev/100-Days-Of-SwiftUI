//
//  ContentView.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 25.07.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isWantWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 1
    
    @State private var randomItem = Item.getRandomItem()
    @State private var showScore = false
    
    var isWin: Bool {
        return (randomItem == randomItem.inverse && isWantWin) == isWantWin
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                .FBA1B7, .FFD1DA, .FFDBAA
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Challenge day 25")
                    .font(.largeTitle.bold())
                Spacer()
                Text("Round: \(round)")
                
                HStack {
                    ForEach(Item.allCases) { item in
                        Button {
                            check(selected: item)
                        } label: {
                            Text(item.toEmoji)
                                .foregroundColor(.orange)
                        }
                        
                    }
                    .font(.system(size: 90))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 60)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding()

                VStack(spacing: 10) {
                    Text("tip: \(randomItem.rawValue.capitalized), \(isWantWin.toWinOrLose)")
                    Text("score: \(score)")
                }
                Group {
                    Spacer()
                    Spacer()
                }
            }
            .font(.title3.bold())
            .foregroundColor(.secondary)
            
            .alert("The End", isPresented: $showScore) {
                Button("New game", action: reset)
            } message: {
                Text("Your score is \(score)")
            }
        }
    }
    
    func check(selected item: Item) {
        
        if randomItem == item {
            // if items is equel
            return
        }
        
        round += 1
        
        if isWin {
            score += 1
        }
        
        shuffle()
        
        if round == 10 {
            showScore = true
        }
    }
    
    func shuffle() {
        isWantWin.toggle() // or random
        randomItem = Item.getRandomItem()
    }
    
    func reset() {
        round = 1
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
