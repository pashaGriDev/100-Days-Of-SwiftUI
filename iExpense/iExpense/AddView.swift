//
//  AddView.swift
//  iExpense
//
//  Created by Павел Грицков on 02.08.23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expanses: Expense
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type: TypeExpense = .personal
    @State private var amount = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(TypeExpense.allCases) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.navigationLink)
                
                TextField("Amount",
                          value: $amount,
                          // пользовательская валюта или по умолчанию usd
                          format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expanses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expanses: Expense()) // фиктивое зачение
    }
}
