//
//  CoinDetailView.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import SwiftUI

struct CoinDetailView: View {
    @StateObject private var viewModel = CoinDetailViewModel()
    let coinID: String
    
    var body: some View {
        VStack {
            if let coinDetail = viewModel.coinDetail {
                Text(coinDetail.name)
                    .font(.largeTitle)
                
                Text(coinDetail.description ?? "No description available")
                    .padding()
                
                // Add more fields for the detail view
                if let tags = coinDetail.tags {
                    Text("Tags: \(tags.map { $0.name }.joined(separator: ", "))")
                }
                
                // Add other UI elements to display coin details
            } else if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
            }
        }
        .onAppear {
            viewModel.fetchCoinDetail(coinID: coinID)
        }
        .navigationTitle("Coin Detail")
    }
}

