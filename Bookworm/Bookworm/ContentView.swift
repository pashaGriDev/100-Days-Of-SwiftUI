//
//  ContentView.swift
//  Bookworm
//
//  Created by Павел Грицков on 11.09.23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        TextEditorView(notes: $notes)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

