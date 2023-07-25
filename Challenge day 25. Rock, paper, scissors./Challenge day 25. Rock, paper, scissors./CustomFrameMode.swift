//
//  CustomFrameMode.swift
//  Challenge day 25. Rock, paper, scissors.
//
//  Created by Павел Грицков on 25.07.23.
//

import SwiftUI

struct CustomFrameMode: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(4)
            .background(.white)
            .padding(2)
            .background(.gray)
    }
}

extension View {
    func customFrameMode() -> some View {
        modifier(CustomFrameMode())
    }
}
