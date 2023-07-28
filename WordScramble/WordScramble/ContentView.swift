//
//  ContentView.swift
//  WordScramble
//
//  Created by Павел Грицков on 28.07.23.
//

import SwiftUI

struct ContentView: View {
    let people = ["Lola", "Alex", "Ray", "Bob"]
    
    var body: some View {
        List {
            Text("Static row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static row")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
