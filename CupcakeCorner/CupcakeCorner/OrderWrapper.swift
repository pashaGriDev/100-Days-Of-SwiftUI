//
//  OrderWrapper.swift
//  CupcakeCorner
//
//  Created by Павел Грицков on 20.08.23.
//

import SwiftUI

class OrderWrapper: ObservableObject {
    @Published var order: Order

    init() {
        self.order = Order()
    }
}
