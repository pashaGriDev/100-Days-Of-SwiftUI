//
//  Activity.swift
//  HabitTracker
//
//  Created by Павел Грицков on 20.08.23.
//

import Foundation

class Activities: ObservableObject {
    @Published var items: [Activity] = [] {
        didSet {
            guard let encoded = try? JSONEncoder().encode(items) else {
                fatalError("Failed encode data")
            }
            UserDefaults.standard.set(encoded, forKey: "items")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "items")  {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
                self.items = decoded
            }
        } else {
            self.items = []
        }
    }
}

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    
    let title: String
    let description: String
    var completionCount = 0
}
