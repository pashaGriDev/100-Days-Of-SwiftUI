//
//  String + ext.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 25.07.23.
//

import Foundation

extension String {

    var toEmoji: String {
        switch self {
        case "Rock" : return "🪨"
        case "Paper" : return "📜"
        case "Scissors" : return "✂️"
        default : return "🐷"
        }
    }
}
