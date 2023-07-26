//
//  ContentView.swift
//  BetterRest
//
//  Created by Павел Грицков on 26.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        
//        Stepper("\(sleepAmount.formatted()) hours",
//                value: $sleepAmount,
//                in: 1...8,
//                step: 0.25)
        
        DatePicker("Pleace enter a date",
                   selection: $wakeUp,
                   in: Date.now...) // от сегодня до где-то в будущем
//            .labelsHidden() // better way hide label
        
    }
    
    func exampleDate() {
        // сегодня + 1 день (86400 примерно 1 день в сек)
        let tomorrow = Date.now.addingTimeInterval(86400)
        // диапазон от сегодня до завтра
        let range = Date.now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
