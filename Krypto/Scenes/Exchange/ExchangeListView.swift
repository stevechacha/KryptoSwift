//
//  ExchangeListView.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import SwiftUI

struct ExchangeListView: View {
    @StateObject private var viewModel = ExchangeListViewModel()
    @State private var searchCoinExchange = " "

    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading Exchanges...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    LazyVStack {
                        ForEach(viewModel.exchanges) { exchange in
                            NavigationLink(value: exchange){
                                ExchangeItem(exchange: exchange)
                                    .foregroundColor(.black)
                
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exchanges")
            .searchable(text: $searchCoinExchange)
            .onAppear {
                viewModel.fetchExchanges()
            }
            .navigationDestination(for: Exchange.self){ exchange in
                ExchangesDetailsView(exchangeId: exchange.id!)
            }
        }
    }
}



struct ExchangeItem: View {
    @State private var expanded = false
    let exchange: Exchange

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    Text(exchange.name?.prefix(16) ?? "Anonymous")
                        .font(.system(size: 18, weight: .medium))
                    Spacer()
                    
                    Text(exchange.active == true ? "Active" : "Dormant")
                        .font(.system(size: 14))
                        .foregroundColor(exchange.active == true ? .green : .gray)
                        .padding(.trailing, 8)
                }
                
                Button(action: { expanded.toggle()}) {
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                }
            }
            .padding(.bottom, 8)

            if expanded {
                Text(exchange.description?.isEmpty == false ? exchange.description! : "No description found!")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
            }

            HStack(spacing: 16) {
                MarketItem(title: "Adjusted\nRank", value: exchange.adjustedRank ?? 0)
                MarketItem(title: "Reported\nRank", value: exchange.reportedRank ?? 0)
                MarketItem(title: "Markets", value: exchange.markets ?? 0)
                MarketItem(title: "Currencies", value: exchange.currencies ?? 0)
            }
            .padding(.top, 8)

            if let links = exchange.links {
                HStack {
                    if let twitter = links.twitter?.first {
                        LinkItem(linkTitle: "Twitter", link: twitter)
                    }
                    if let website = links.website?.first {
                        LinkItem(linkTitle: "Website", link: website)
                    }
                    if let facebook = links.facebook?.first {
                        LinkItem(linkTitle: "Facebook", link: facebook)
                    }
                    if let youTube = links.youtube?.first {
                        LinkItem(linkTitle: "YouTube", link: youTube)
                    }
                }
            }
        }
        .padding(16)
        .background(exchange.active == true ? Color.clear : Color.gray.opacity(0.12))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct MarketItem: View {
    let title: String
    let value: Int

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .frame(height: 30)

            Text("\(value)")
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: 54)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
        }
        .frame(maxWidth: .infinity)
    }
}

struct LinkItem: View {
    let linkTitle: String
    let link: String

    var body: some View {
        Button(action: {
            if let url = URL(string: link) {
                UIApplication.shared.open(url)
            }
        }) {
            Text(linkTitle)
                .underline()
                .foregroundColor(.blue)
                .padding(.trailing, 8)
        }
    }
}



