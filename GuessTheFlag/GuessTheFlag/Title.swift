//
//  Title1.swift
//  GuessTheFlag
//
//  Created by Павел Грицков on 24.07.23.
//

import SwiftUI

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title.weight(.bold))
            .foregroundColor(.white)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
