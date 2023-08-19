//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Павел Грицков on 17.08.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = OrderWrapper()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(order.order.quantity)", value: $order.order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn: $order.order.specialRequestEnabled.animation()) // анимирует появление

                    if order.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $order.order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
