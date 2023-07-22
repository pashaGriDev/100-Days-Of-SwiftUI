//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Павел Грицков on 22.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var conuseRedText = false
    
    var body: some View {
        VStack {
            Text("Red")
            // ребенок имеет приоритет
                .font(.largeTitle.bold())
            // некоторые модификаторы могут только усиливаться
                .blur(radius: 3)
            Text("Blue")
                .foregroundColor(.red)
            Text("Green")
        }
        .font(.title.bold())
        .blur(radius: 2)
        .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
