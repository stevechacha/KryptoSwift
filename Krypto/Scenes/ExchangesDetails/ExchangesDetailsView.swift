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
//                    Text(exchangeDetail.name)
//                        .font(.body)
//                    
//                    Text(exchangeDetail.description ?? " No coin description")
                }
                else if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding(.top, 16)
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .padding(.top, 16)
                }
            }
            .onAppear {
                viewModel.getExchangeDetail(exchangeID: exchangeId)
            }
        }
    }
}


struct ExchangesDetailsCellView: View {
    let exchange: ExchangeDetail
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(exchange.name)
                .font(.headline)
            
            Text(exchange.description ?? " No coin exchange description")
                    .font(.subheadline)
           
            if let website = exchange.links?.website?.first {
                Link("Website", destination: URL(string: website)!)
            }
            Divider()
        }
    }
}
