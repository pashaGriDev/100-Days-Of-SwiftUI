//
//  Bool + ext.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 26.07.23.
//

import Foundation

extension Bool {
    var toWinOrLose: String {
        self ? "Win" : "Lose"
    }
}
