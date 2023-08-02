//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Павел Грицков on 02.08.23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
