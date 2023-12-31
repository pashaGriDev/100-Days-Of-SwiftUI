//
//  Order.swift
//  CupcakeCorner
//
//  Created by Павел Грицков on 18.08.23.
//

import SwiftUI


struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    // данные пользователя
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        // проверка на состоит ли строка только из пробелов
        if name.isOnlyWithespace || streetAddress.isOnlyWithespace || city.isOnlyWithespace || zip.isOnlyWithespace {
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


// MARK: - Код из занятия

class OrderClass: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }

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
        // проверка на состоит ли строка только из пробелов
        if name.isOnlyWithespace || streetAddress.isOnlyWithespace || city.isOnlyWithespace || zip.isOnlyWithespace {
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)

        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)

        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    init() { }
}
