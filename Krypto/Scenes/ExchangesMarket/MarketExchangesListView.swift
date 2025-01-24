//
//  MarketListView.swift
//  Krypto
//
//  Created by stephen chacha on 11/10/2024.
//

import SwiftUI

import SwiftUI

struct MarketListView: View {
    @StateObject private var viewModel = MarketExchangesViewModel()
    @State private var searchText: String = ""
    let exchangeId: String

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading markets...")
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button(action: {
                            Task { await viewModel.fetchMarketExchange(for: exchangeId) }
                        }) {
                            Text("Retry")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                } else if let markets = viewModel.markets {
                    ScrollView {
                        LazyVStack {
                            ForEach(markets.filter { searchText.isEmpty || $0.pair.lowercased().contains(searchText.lowercased()) }, id: \.pair) { market in
                                MarketItemView(market: market)
                                Divider()
                            }
                        }
                    }
                    .padding(.horizontal)
                } else {
                    Text("No markets found.")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Markets \(exchangeId)")
            .searchable(text: $searchText, prompt: "Search by pair")
            .onAppear {
                Task { await viewModel.fetchMarketExchange(for: exchangeId) }
            }
        }
    }
}

struct MarketItemView: View {
    let market: Market

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(market.pair)
                .font(.headline)
                .bold()
            Text("Base Currency: \(market.baseCurrencyName)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Quote Currency: \(market.quoteCurrencyName)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            if let url = URL(string: market.marketURL) {
                Link("Trade Here", destination: url)
                    .font(.footnote)
                    .foregroundColor(.blue)
            }

            Text("Last Updated: \(formatDate(market.lastUpdated))")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }

    // Helper function to format the date
    func formatDate(_ isoDate: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: isoDate) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .short
            return displayFormatter.string(from: date)
        }
        return isoDate
    }
}

