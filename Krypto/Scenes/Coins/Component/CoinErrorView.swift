//
//  CoinErrorView.swift
//  Krypto
//
//  Created by stephen chacha on 16/10/2024.
//


import SwiftUI

struct CoinErrorView: View {
    let errorMessage: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Error")
                .font(.title)
                .foregroundColor(.red)
            Text(errorMessage)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: {
                retryAction()
            }) {
                Text("Retry")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
    }
}

struct CoinErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CoinErrorView(errorMessage: "Failed to load coins.", retryAction: {})
            .previewLayout(.sizeThatFits)
    }
}
