//
//  MarketListView.swift
//  Krypto
//
//  Created by stephen chacha on 11/10/2024.
//

import SwiftUI

import SwiftUI

struct MarketListView: View {
    @StateObject private var viewModel = MarketViewModel()
    @State private var searchText: String = ""
    let exchangeId: String

    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading markets...")
                }
                else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                }
                else {
                    LazyVStack {
                        ForEach(viewModel.markets.filter { searchText.isEmpty || $0.pair.contains(searchText) }) { market in
                            MarketItemView(market: market)
                            Divider()
                        }
                    }
                }
            }
            .navigationTitle("Markets")
            .searchable(text: $searchText)
            .onAppear {
                viewModel.fetchMarketExchange(for: exchangeId)
            }
        }
    }
}

struct MarketItemView: View {
    let market: Market

    var body: some View {
        VStack(alignment: .leading) {
            Text(market.pair)
                .font(.headline)
            Text("Base Currency: \(market.baseCurrencyName)")
                .font(.subheadline)
            Text("Quote Currency: \(market.quoteCurrencyName)")
                .font(.subheadline)

            if let url = URL(string: market.marketUrl) {
                Link("Trade Here", destination: url)
                    .font(.footnote)
                    .foregroundColor(.blue)
            }

            Text("Last Updated: \(market.lastUpdated)")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

