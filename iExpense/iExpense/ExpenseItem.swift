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
    let type: TypeExpense
    let amount: Double
}

enum TypeExpense: String, CaseIterable , Identifiable, Codable {
    
    case personal
    case business
    
    var id: Self { self }
}
