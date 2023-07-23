//
//  Watermark.swift
//  ViewsAndModifiers
//
//  Created by Павел Грицков on 23.07.23.
//

import SwiftUI

struct Watermark: ViewModifier {
    
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermark(text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
