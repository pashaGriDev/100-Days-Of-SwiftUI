//
//  TextEditorView.swift
//  Bookworm
//
//  Created by Павел Грицков on 11.09.23.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var notes: String
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(notes: .constant("Some text"))
    }
}
