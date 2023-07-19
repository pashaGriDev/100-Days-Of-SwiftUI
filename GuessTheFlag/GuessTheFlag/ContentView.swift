//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Павел Грицков on 19.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack {
                Text("4")
                Text("5")
                Text("6")
            }
            HStack {
                Text("7")
                Text("8")
                Text("9")
            }
        }
        
//        VStack {
//            Spacer()
//            Text("first")
//            Text("second")
//            Text("third")
//            Spacer()
//            Spacer()
//        }
//        ZStack {
//            // рисует по порядку
//            Text("Hello world") // 1
//            Text("This is inside a stack") // 2
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
