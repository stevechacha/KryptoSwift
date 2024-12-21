//
//  ExchangeImageView.swift
//  Krypto
//
//  Created by stephen chacha on 16/10/2024.
//


import SwiftUI

struct ExchangeImageView: View {
    let imageURL: String?

    var body: some View {
        if let imageURL = imageURL, let url = URL(string: imageURL) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 50, height: 50)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                case .failure:
                    Image(systemName: "building.2.crop.circle.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                        .frame(width: 50, height: 50)
                @unknown default:
                    Image(systemName: "building.2.crop.circle.badge.questionmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                }
            }
        } else {
            Image(systemName: "building.2.crop.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)
        }
    }
}

struct ExchangeImageView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeImageView(imageURL: "https://www.binance.com/image.png")
            .frame(width: 50, height: 50)
    }
}
