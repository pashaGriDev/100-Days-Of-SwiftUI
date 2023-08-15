//
//  ColorCyclingCircle.swift
//  Drawing
//
//  Created by Павел Грицков on 15.08.23.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.1
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingCircle()
    }
}
