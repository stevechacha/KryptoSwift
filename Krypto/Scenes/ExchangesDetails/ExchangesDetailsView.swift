//
//  ExchangesDestails.swift
//  Krypto
//
//  Created by stephen chacha on 10/10/2024.
//

import SwiftUI

struct ExchangesDetailsView : View {
    @StateObject private var viewModel = ExchangesDetailsViewModel()
    let exchangeId: String
    var body: some View {
        ScrollView {
            VStack {
                if let exchangeDetail = viewModel.exchangeDetail {
                    ExchangesDetailsCellView(exchange: exchangeDetail)
                }
                else if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding(.top, 16)
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .padding(.top, 16)
                }
            }.padding()
            .onAppear {
                Task { await viewModel.getExchangeDetail(exchangeID: exchangeId) }
            }
        }
    }
}


struct ExchangesDetailsCellView: View {
    let exchange: ExchangeDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Display exchange name
            Text(exchange.name ?? "No Coin exchange name")
                .font(.headline)
            
            // Display exchange description
            Text(exchange.description ?? "No coin exchange description")
                .font(.subheadline)
            
//            // Display all links conditionally
//            if let links = exchange.links {
//                HStack {
//                    if let twitter = links?.twitter.first {
//                        LinkItem(linkTitle: "Twitter", link: twitter)
//                    }
//                    if let website = links.website?.first {
//                        LinkItem(linkTitle: "Website", link: website)
//                    }
//                    if let facebook = links.facebook?.first {
//                        LinkItem(linkTitle: "Facebook", link: facebook)
//                    }
//                    if let youTube = links.youtube?.first {
//                        LinkItem(linkTitle: "YouTube", link: youTube)
//                    }
//                }
//            }
            
            Divider()
        }
    }
}

