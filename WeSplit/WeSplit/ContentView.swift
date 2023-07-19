//
//  ContentView.swift
//  WeSplit
//
//  Created by Павел Грицков on 16.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var chekAmount = 0.0
    @State private var numberPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let  tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // смтреть ниже
        let peopleCount = Double(numberPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = chekAmount / 100 * tipSelection
        let grandTotal = chekAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var amountTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = chekAmount / 100 * tipSelection
        let grandTotal = chekAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
        // на уроке после добавления NavigationView пикер открывался в новом окне (по типу перехода в навегаторе в новое ВК и обратно)
            Form {
                Section {
        // .currency(code: Locale.current.currency?.identifier ?? "USD"
        // валюта из системы (которую использует пользователь) или по умолчанию
                    TextField("Amount", value: $chekAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad) // тип раскладки клавиатуры
                        .focused($amountIsFocused) // отслеживает состояние
        
        // хитрая штука, цикл начанается с 2, но видимо передает в $numberPeople 0
        // потому и тут let peopleCount = Double(numberPeople + 2) есть +2
                    Picker("Number of people", selection: $numberPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
//                Section {
//                    Picker("Tip percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    // можно выбрать стиль для пикера
//                    .pickerStyle(.segmented)
//                } header: {
//                    // добавляет текст над секцией
//                    Text("How much tip do you want to leave?")
//                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0)%")
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(amountTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount total")
                }
            }
            // титул для формы которая крепиться к навигатору
            .navigationTitle("WeSplit")
            .scrollDisabled(true)
            // добавление кнопки Done чтоб свернуть клавеатуру
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer() // разденитель
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
