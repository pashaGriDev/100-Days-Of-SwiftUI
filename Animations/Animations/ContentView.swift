//
//  ContentView.swift
//  Animations
//
//  Created by Павел Грицков on 31.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShoeingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShoeingRed.toggle()
                }
            }
            
            if isShoeingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale) // размер при анимации
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
