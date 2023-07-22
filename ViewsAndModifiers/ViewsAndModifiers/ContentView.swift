//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Павел Грицков on 22.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello world") {
            print(type(of: self.body))
        }
        .padding()
        .background(.red)
        .padding()
        .background(.green)
        .padding()
        .background(.gray)
        .padding()
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
