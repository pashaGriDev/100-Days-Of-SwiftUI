//
//  ContentView.swift
//  Moonshot
//
//  Created by Павел Грицков on 03.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                    Image("cat")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 300)
//                } label: {
                    Text("Row \(row)")
//                }
            }
                .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
