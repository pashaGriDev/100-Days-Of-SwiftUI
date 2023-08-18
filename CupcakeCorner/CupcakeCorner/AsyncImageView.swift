//
//  AsyncImageView.swift
//  CupcakeCorner
//
//  Created by Павел Грицков on 18.08.23.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}
