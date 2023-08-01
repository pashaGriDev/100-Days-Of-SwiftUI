//
//  Expense.swift
//  iExpense
//
//  Created by Павел Грицков on 02.08.23.
//

import Foundation

class Expense: ObservableObject {
    @Published var items = [ExpenseItem]()
}
