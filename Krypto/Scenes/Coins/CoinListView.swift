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

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.coins) { coin in
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
            .onAppear {
                Task { await viewModel.fetchCoinWithResult() }
            }
            .navigationDestination(for: Coin.self) { coin in
                CoinDetailView(coinID: coin.id)
            }
            .navigationTitle("Coins")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
  

}



struct CoinListCell: View {
    var coin : Coin
    var body: some View {

        HStack {
            CircularProfileImageView()
            VStack (alignment: .leading){
                Text(coin.name)
                    .fontWeight(.semibold)
                Text(coin.symbol)
            }
            .font(.footnote)
            .foregroundColor(.black)
            
            Spacer()
            
            VStack (alignment: .trailing){
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

