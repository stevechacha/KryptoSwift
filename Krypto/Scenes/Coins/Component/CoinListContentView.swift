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
//
//struct CoinListContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinListContentView(coins: [
//            Coin(id: "btc-bitcoin", name: "Bitcoin", symbol: "BTC", rank: 1, isNew: "coin", isActive: false, type: true),
//            Coin(id: "eth-ethereum", name: "Ethereum", symbol: "ETH", rank: 2, isNew: "coin", isActive: false, type: true)
//        ])
//    }
//}
