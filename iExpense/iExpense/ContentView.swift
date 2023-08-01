//
//  ContentView.swift
//  iExpense
//
//  Created by Павел Грицков on 01.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showinfSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showinfSheet.toggle()
        }
        .sheet(isPresented: $showinfSheet) {
            SecondView(name: "Bob")
        }
        
    }
}

// MARK: - SecondView

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello \(name)")
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
