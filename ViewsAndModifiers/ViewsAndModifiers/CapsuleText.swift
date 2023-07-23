//
//  CapsuleText.swift
//  ViewsAndModifiers
//
//  Created by Павел Грицков on 23.07.23.
//

import SwiftUI

struct CapsuleText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title.bold())
            .blur(radius: 2)
    }
    
}
