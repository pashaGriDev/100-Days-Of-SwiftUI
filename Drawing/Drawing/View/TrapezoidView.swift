//
//  TrapezoidView.swift
//  Drawing
//
//  Created by Павел Грицков on 16.08.23.
//

import SwiftUI

struct TrapezoidView: View {

    @State private var insetAmount = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 300, height: 200)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
}
