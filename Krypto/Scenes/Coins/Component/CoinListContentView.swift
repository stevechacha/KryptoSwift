//
//  CoinListContentView.swift
//  Krypto
//
//  Created by stephen chacha on 16/10/2024.
//


import SwiftUI

struct CoinListContentView: View {
    let coins: [Coin]
    
    var body: some View {
        List(coins) { coin in
            NavigationLink(value: coin) {
                VStack {
                    CoinListCell(coin: coin)
                    Divider()
                }
                .padding(.vertical, 4)
            }
        }
        .listStyle(PlainListStyle()) // Optional: Customize list style
    }
}

