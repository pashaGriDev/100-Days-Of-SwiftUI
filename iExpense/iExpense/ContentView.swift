//
//  ContentView.swift
//  iExpense
//
//  Created by Павел Грицков on 01.08.23.
//

import SwiftUI

// 1. class который соотвествует протоколу ObservableObject
// 2. помечаем свойства которые хотим использовать @Published
// 3. создаем экземпляр с обверткой @StateObject

class User: ObservableObject {
    @Published var firstname = "Bob"
    @Published var lastname = "Baggins"
}

struct ContentView: View {
//    @State private var user = User() // для структур
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstname) \(user.lastname)")
            
            TextField("Firstname", text: $user.firstname)
            TextField("Lastname", text: $user.lastname)
        }
        .padding()
        .font(.title3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
