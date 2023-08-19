//
//  Order.swift
//  CupcakeCorner
//
//  Created by Павел Грицков on 18.08.23.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var type = 0
    @Published var quantity = 3

    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    // данные пользователя
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
    
    var cost: Double {
        // $2 за торт
        var cost = Double(quantity) * 2

        // сложные торты стоят дороже
        cost += (Double(type) / 2)

        // $1 с доп глазурью
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50 с доп посыпкай
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
}
