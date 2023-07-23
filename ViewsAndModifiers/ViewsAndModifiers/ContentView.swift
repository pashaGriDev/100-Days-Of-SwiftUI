//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Павел Грицков on 22.07.23.
//

import SwiftUI

struct UserStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.orange)
            .frame(width: 250, height: 100)
            .background(.black)
            .padding(3)
            .background(.green)
            .padding()
            .background(.black)
    }
    
    // как использовать если нет расширеня?
    // .modifier(UserStyle())
}

extension View {
    // более удобный вызов
    // .userStyle()
    
    func userStyle() -> some View {
        modifier(UserStyle())
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello World")
                .userStyle()
            Color.gray
                .frame(width: 250, height: 100)
                .watermark(text: "Made in Chine")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
