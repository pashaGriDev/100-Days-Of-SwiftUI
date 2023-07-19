//
//  ContentView.swift
//  Challenge day 19. Converter
//
//  Created by Павел Грицков on 19.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var dataInput: DistanceUnit = .kilometers
    @State private var dataOutput: DistanceUnit = .miles
    @FocusState private var amountIsFocused: Bool
    
    var output: Measurement<UnitLength> {
        let leagth = Measurement(value: input, unit: dataInput.convertToUnitLength)
        return leagth.converted(to: dataOutput.convertToUnitLength)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the data", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    // пикер сделан по принципу оф доки
                    Picker("Unit", selection: $dataInput) {
                        ForEach(DistanceUnit.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    
                } header: {
                    Text("Input")
                }
                
                Section {
                    Picker("Unit", selection: $dataOutput) {
                        ForEach(DistanceUnit.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    
                    Text(output.description)
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Converter")
            // кнопка Done
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
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
