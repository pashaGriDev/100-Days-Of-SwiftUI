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
            Button("Hello World") {
                conuseRedText.toggle()
            }
            .foregroundColor(conuseRedText ? .red : .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
