//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Павел Грицков on 19.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
        .padding()
        .foregroundColor(.white)
        .background(.red)
        .cornerRadius(15)
        
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Pleace read this")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
