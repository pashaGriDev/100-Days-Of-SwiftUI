//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Павел Грицков on 22.07.23.
//

import SwiftUI

struct ContentView: View {

    let labelHello = Text("Hello")
    let labelWorld = Text("World")
    
    @ViewBuilder var labels: some View {
        VStack {
            Text("Hello")
            Text("World")
                .foregroundColor(.green)
        }
        .font(.title.bold())
        .padding()
        .background(.gray)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            CapsuleText(text: "Hello")
                .foregroundColor(.white)
            CapsuleText(text: "World")
                .foregroundColor(.cyan)
        }
        .padding()
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
