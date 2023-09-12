//
//  RatingView.swift
//  Bookworm
//
//  Created by Павел Грицков on 12.09.23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maxRating + 1, id: \.self) { numder in
                image(for: numder)
                    .foregroundColor(numder > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = numder
                    }
            }
        }
    }
    
    func image(for numder: Int) -> Image {
        if numder > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
