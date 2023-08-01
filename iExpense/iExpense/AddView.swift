//
//  AddView.swift
//  iExpense
//
//  Created by Павел Грицков on 02.08.23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expanses: Expense
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.navigationLink)
                
                TextField("Amount",
                          value: $amount,
                          format: .currency(code: "USD"))
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expanses: Expense())
    }
}
