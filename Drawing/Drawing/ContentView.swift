//
//  ContentView.swift
//  Drawing
//
//  Created by Павел Грицков on 14.08.23.
//

import SwiftUI

struct ContentView: View {
    // красивый цветок
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    // бублик с цветом
    @State private var colorCycle = 0.0
    // RGB круги
    @State private var amount = 0.0
    
    var body: some View {
        RGBCircle(amount: $amount)
        
//        ColorCircleView(colorCycle: $colorCycle)
//        FlowerView(petalOffset: $petalOffset, petalWidth: $petalWidth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
