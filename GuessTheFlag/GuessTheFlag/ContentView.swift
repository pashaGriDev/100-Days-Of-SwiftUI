//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Павел Грицков on 19.07.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
        }
        
        // если кнопка зальется цветом и нужно вернуть оригинальное изображение
//        .renderingMode(.original)
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Text("Tap me!")
//                .padding()
//                .foregroundColor(.white)
//                .background(.green)
//                .cornerRadius(10)
//        }
        
//        VStack {
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//        }
        
        // можно выполнять какое-то действие в кложуре
//        Button("Do something") {
//            print("tapped button")
//        }
        
//        Button("Delete selection", role: .destructive, action: executeDelete)
    }
    // можно выносить action для кнопки в отдельный метод
    //    func executeDelete() {
    //        print("Now deleting")
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
