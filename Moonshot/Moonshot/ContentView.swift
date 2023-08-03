//
//  ContentView.swift
//  Moonshot
//
//  Created by Павел Грицков on 03.08.23.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        self.text = text
        print("Create a new CustomText")
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            // ленивый стек который создает элемент когда о появляется на экране
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
