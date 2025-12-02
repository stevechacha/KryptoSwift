//
//  ExchangesDetailsView.swift
//  Krypto
//
//  Created by stephen chacha on 10/10/2024.
//

import SwiftUI

struct ExchangesDetailsView: View {
    @StateObject private var viewModel = ExchangesDetailsViewModel()
    let exchangeId: String
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                CoinErrorView(errorMessage: errorMessage) {
                    Task {
                        await viewModel.getExchangeDetail(exchangeID: exchangeId)
                    }
                }
            } else if let exchangeDetail = viewModel.exchangeDetail {
                ScrollView {
                    ExchangesDetailsCellView(exchange: exchangeDetail)
                        .padding()
                }
            }
        }
        .onAppear {
            if viewModel.exchangeDetail == nil && !viewModel.isLoading {
                Task {
                    await viewModel.getExchangeDetail(exchangeID: exchangeId)
                }
            }
        }
        .navigationTitle("Exchange Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ExchangesDetailsCellView: View {
    let exchange: ExchangeDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(exchange.name ?? "")
                .font(.largeTitle)
                .padding(.top, 16)
            
            Text(exchange.description ?? "No description available")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
        }
    }
}

