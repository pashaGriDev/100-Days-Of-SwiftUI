//
//  Items.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 26.07.23.
//

import Foundation

enum Item: String, CaseIterable, Identifiable, Comparable {
    
    // protocol Comparable
    static func < (lhs: Item, rhs: Item) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case rock, paper, scissors
    
    // protocol Identifiable
    var id: Self { self }
    
    
    var inverse: Item {
        switch self {
        case .rock:
            return .paper
        case .paper:
            return .scissors
        case .scissors:
            return .rock
        }
    }
    
    static func getRandomItem() -> Item {
        let randomItem = Item.allCases.randomElement()!
        return randomItem
    }
}

extension Item {
    var toEmoji: String {
        switch self {
        case .rock:
            return "✊🏼"
        case .paper:
            return "🤚🏼"
        case .scissors:
            return "✌🏼"
        }
    }
}

