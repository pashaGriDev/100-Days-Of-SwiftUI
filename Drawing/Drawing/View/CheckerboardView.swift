//
//  CheckerboardView.swift
//  Drawing
//
//  Created by Павел Грицков on 16.08.23.
//

import SwiftUI

struct CheckerboardView: View {
    @Binding var rows: Int
    @Binding var columns: Int
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 8
                }
            }
    }
}
