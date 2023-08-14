//
//  ContentView.swift
//  iExpense
//
//  Created by Павел Грицков on 01.08.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expense()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(TypeExpense.allCases) { type in
                    Section {
                        ForEach(expenses.items) { item in
                            if item.type == type {
                                ExpenseRow(item: item)
                                    // задает рядам разные цвета
                                    .listRowBackground(expenseColor(item.amount))
                            }
                        }
                        // удаление элементов
                        .onDelete(perform: removeItem)
                    } header: {
                        Text("\(type.rawValue.capitalized)")
                    }
                }
            }
            .navigationTitle("iExpanses")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expanses: expenses)
            }
        }
        
        
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func expenseColor(_ amout: Double) -> Color {
        let temp: Color
        
        switch amout {
        case ...10: temp = Color.green
        case ...100: temp = Color.blue
        case 101...: temp = Color.red
        default: temp = Color.white
        }
        
        return temp.opacity(0.2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
