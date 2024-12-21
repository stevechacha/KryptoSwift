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
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let coinDetail = viewModel.coinDetail {
                    Text(coinDetail.name ?? "No name avaiable")
                        .font(.largeTitle)
                        .padding(.top, 16)
                    
                    Text(coinDetail.description ?? "No description available")
                        .padding()
                    
//                    if let tags = coinDetail.tags {
//                        Text("Tags: \(tags.map { $0.name }.joined(separator: ", "))")
//                    }
                    
                } else if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding(.top, 16)
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .padding(.top, 16)
                }
            }
            .padding()
            .onAppear {
//                viewModel.fetchCoinDetail(coinID: coinID)
                Task { await viewModel.fetchCoinDetail(coinID: coinID)}
            }
        }
        .navigationTitle("Coin Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

