//
//  ContentView.swift
//  iExpense
//
//  Created by Павел Грицков on 01.08.23.
//

import SwiftUI

struct User: Codable {
    let firstname: String
    let lastname: String
}

struct ContentView: View {
    @State private var user = User(firstname: "Taylor", lastname: "Swift")

    
    var body: some View {
        
        Button("Save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
