//
//  ContentView.swift
//  iExpense
//
//  Created by Павел Грицков on 01.08.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expense()
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpanses")
            .toolbar {
                EditButton()
                
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
