//
//  Activity.swift
//  HabitTracker
//
//  Created by Павел Грицков on 20.08.23.
//

import Foundation

class Activities: ObservableObject {
    @Published var items: [Activity] = []
}

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    
    let title: String
    let description: String
    var completionCount = 0
}
