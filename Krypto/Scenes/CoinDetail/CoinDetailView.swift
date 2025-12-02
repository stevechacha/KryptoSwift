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
        Group {
            if viewModel.isLoading {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                CoinErrorView(errorMessage: errorMessage) {
                    Task {
                        await viewModel.fetchCoinDetail(coinID: coinID)
                    }
                }
            } else if let coinDetail = viewModel.coinDetail {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(coinDetail.name)
                            .font(.largeTitle)
                            .padding(.top, 16)
                        
                        Text(coinDetail.description ?? "No description available")
                            .padding()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            if viewModel.coinDetail == nil && !viewModel.isLoading {
                Task {
                    await viewModel.fetchCoinDetail(coinID: coinID)
                }
            }
        }
        .navigationTitle("Coin Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

