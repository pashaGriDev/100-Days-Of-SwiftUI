//
//  ContentView.swift
//  Moonshot
//
//  Created by Павел Грицков on 03.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.9)
                // второй фрайм выравнивает кадор по центру
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
