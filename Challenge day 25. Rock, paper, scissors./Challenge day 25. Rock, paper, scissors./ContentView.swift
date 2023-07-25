//
//  ContentView.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 25.07.23.
//

import SwiftUI

struct ContentView: View {
    
    let items = ["Rock", "Paper", "Scissors"]
    @State private var isWantWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 1
    
    var randomItem: String {
        items.randomElement()!
    }
    
    var winItem: String {
        switch randomItem {
        case items[0]: return items[1]
        case items[1]: return items[2]
        case items[2]: return items[0]
        default: return "Wrong"
        }
    }
    
    var isWin: Bool {
        print("равны ли \(randomItem == winItem)? хотим выйграть \(isWantWin)?")
        return (randomItem == winItem && isWantWin) == isWantWin
    }
 
    var winOrLose: String {
        isWantWin ? "Win" : "Lose"
    }
    
    let conditions = false
    
    
    var body: some View {
        VStack {
            Spacer()
            
//            Text("Items")
            
            Spacer()
            
            Text("round: \(round)")
            Spacer()
            
            HStack {
                ForEach(items, id: \.self) {item in
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
                Text("app selected: \(randomItem), \(winOrLose)")
                Text("score: \(score)")
            }
            
            Group {
                Spacer()
                Spacer()
            }
        }
    }
    
    func check(selected item: String) {
        
        round += 1
        print("\(isWin)")
        if isWin {
            score += 1
        }
        
        isWantWin.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
