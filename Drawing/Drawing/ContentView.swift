//
//  ContentView.swift
//  Drawing
//
//  Created by Павел Грицков on 14.08.23.
//

import SwiftUI

struct Arrow: InsettableShape {

    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX  - 40, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - 20, y: rect.midY ))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 20,  y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 40, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - 20, y: rect.maxY))
        path.closeSubpath()

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount = amount
        return arrow
    }
}

struct ColorCyclingArrow: View {
    var amount = 0.0
    var steps = 20
    var body: some View {
        ZStack {
            ForEach(0..<steps) {num in
                Arrow()
                    .inset(by: Double(num))
                    .stroke(color(for: num), lineWidth: 13)
            }
        }
    }
    
    func color(for value: Int) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: 1)
    }
}

struct ContentView: View {
    // красивый цветок
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    // бублик с цветом
    @State private var colorCycle = 0.0
    // RGB круги
    @State private var amount = 0.0
    // Checkerboard шахмотная доска
    @State private var rows = 4
    @State private var columns = 4

    @State private var lineWidth = 20.0
    @State private var arrowCycle = 20.0
    
    var body: some View {
        VStack {
            Spacer()
            
            ColorCyclingArrow(amount: arrowCycle)
                .frame(width: 200, height: 200)
            Slider(value: $arrowCycle)
            
            Arrow()
                .stroke(.red, lineWidth: lineWidth)
                .frame(width: 200, height: 200)
                .padding(30)
                .onTapGesture {
                    withAnimation {
                        lineWidth = Double.random(in: 5.0...40.0)
                    }
                }
            
            Spacer()
        }
        .padding()
        
        
//        CheckerboardView(rows: $rows, columns: $columns)
//        TrapezoidView()
//        RGBCircle(amount: $amount)
//        ColorCircleView(colorCycle: $colorCycle)
//        FlowerView(petalOffset: $petalOffset, petalWidth: $petalWidth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
