//
//  CoinListView.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import SwiftUI

struct CoinListView: View {
    @StateObject private var viewModel = CoinListViewModel()
    @State private var searchText = ""
    
    private var filteredCoins: [Coin] {
        if searchText.isEmpty {
            return viewModel.coins
        } else {
            return viewModel.coins.filter { coin in
                coin.name.localizedCaseInsensitiveContains(searchText) ||
                coin.symbol.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage {
                    CoinErrorView(errorMessage: errorMessage) {
                        Task {
                            await viewModel.fetchCoinWithResult()
                        }
                    }
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(filteredCoins) { coin in
                                NavigationLink(value: coin) {
                                    VStack {
                                        CoinListCell(coin: coin)
                                        Divider()
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                if viewModel.coins.isEmpty {
                    Task { await viewModel.fetchCoinWithResult() }
                }
            }
            .navigationDestination(for: Coin.self) { coin in
                CoinDetailView(coinID: coin.id)
            }
            .navigationTitle("Coins")
            .searchable(text: $searchText, prompt: "Search coins")
        }
    }
}



struct CoinListCell: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .fontWeight(.semibold)
                Text(coin.symbol)
            }
            .font(.footnote)
            .foregroundColor(.primary)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.type)
                    .fontWeight(.semibold)
                Text(coin.rank.description)
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

