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
    
    let types = ["Business", "Personal"]
    
    
    @State private var singleSelection: UUID?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == .personal {
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.amount,
                                     format:
                                        .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                
                            }
                            // задает рядам разные цвета
                            .listRowBackground(expenseColor(item.amount))
                        }
                    }
                    .onDelete(perform: removeItem)
                } header: {
                    Text(TypeExpense.personal.rawValue.capitalized)
                }
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == .business {
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.amount,
                                     format:
                                        .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                
                            }
                            // задает рядам разные цвета
                            .listRowBackground(expenseColor(item.amount))
                        }
                    }
                    .onDelete(perform: removeItem)
                } header: {
                    Text(TypeExpense.business.rawValue.capitalized)
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
