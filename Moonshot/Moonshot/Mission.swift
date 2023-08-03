//
//  Mission.swift
//  Moonshot
//
//  Created by Павел Грицков on 04.08.23.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}

struct CrewRole: Codable {
    let name: String
    let role: String
}
