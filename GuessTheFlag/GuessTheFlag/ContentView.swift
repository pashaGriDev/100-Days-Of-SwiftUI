//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Павел Грицков on 19.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            // цвет который зависит от темного или светлого мода
//            Color.primary
//            Color.blue
//            Color.secondary
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Hello world")
//                .foregroundColor(.secondary)
                .foregroundStyle(.secondary)
                .padding(60)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
//        ZStack {
//            Color.red
//            // рамка 200 на 200
////                .frame(width: 200, height: 200)
//            // мин ширина 200 макс бесконечно, макс высота 200
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("Hello world!")
////                .background(.red)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
