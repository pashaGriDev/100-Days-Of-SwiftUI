//
//  FlowerView.swift
//  Drawing
//
//  Created by Павел Грицков on 15.08.23.
//

import SwiftUI

struct FlowerView: View {
    
    @Binding var petalOffset: Double
    @Binding var petalWidth: Double
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}
