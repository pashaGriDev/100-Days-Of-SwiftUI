//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Павел Грицков on 23.07.23.
//

import SwiftUI

struct FlagImage: ViewModifier {

    func body(content: Content) -> some View {
            content
                .clipShape(Capsule())
                .shadow(radius: 5)
    }
}

struct FlagImageView: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
