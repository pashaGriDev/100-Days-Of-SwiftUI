//
//  ContentView.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 25.07.23.
//

import SwiftUI

// TODO: навести красоту на подобии приложения с флагами

struct ContentView: View {
    
    @State private var isWantWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 1
    
    @State private var randomItem = Item.getRandomItem()

    var isWin: Bool {
        return (randomItem == randomItem.inverse && isWantWin) == isWantWin
    }

    var body: some View {
        VStack {
            Spacer()

//            Text("Items")
            
            Spacer()
            
            Text("round: \(round)")
            Spacer()
            
            HStack {
                ForEach(Item.allCases) { item in
                    Button {
                        check(selected: item)
                    } label: {
                        Text(item.toEmoji)
                            .foregroundColor(.orange)
                    }

                }
                .font(.system(size: 70))
            }
            Spacer()

            Group {
                Text("app selected: \(randomItem.rawValue.capitalized), \(isWantWin.toWinOrLose)")
                Text("score: \(score)")
            }
            
            Group {
                Spacer()
                Spacer()
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
    }
    
    func shuffle() {
        isWantWin.toggle() // or random
        randomItem = Item.getRandomItem()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
