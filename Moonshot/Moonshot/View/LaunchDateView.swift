//
//  LaunchDateView.swift
//  Moonshot
//
//  Created by Павел Грицков on 19.09.23.
//

import SwiftUI

struct LaunchDateView: View {
    let date: Date?
    
    var body: some View {
        if let date {
            Text(date, format: .dateTime.day().month().year())
                .font(.title3.bold())
        } else {
            Text("")
        }
    }
}

struct LaunchDateView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDateView(date: Date.now)
    }
}
