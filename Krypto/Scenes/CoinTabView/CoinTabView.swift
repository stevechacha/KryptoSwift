//
//  CoinTabView.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//


import SwiftUI

struct CoinTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateThreadView = false
    var body: some View {
        TabView(selection: $selectedTab) {
            CoinListView()
                .tabItem {
                    Label("Coins", systemImage: "bitcoinsign")
                }
                .onAppear { selectedTab = 0}
                .tag(0)
            ExchangeListView()
                .tabItem {
                    Label("Exchange", systemImage: "building.2")
                }
                .onAppear { selectedTab = 1}
                .tag(1)
            
            PriceConversionView()
                .tabItem {
                    Label("Convert", systemImage: "arrow.up.arrow.down")
                }
                .onAppear { selectedTab = 2}
                .tag(2)
        }
    
    }
}

#Preview {
    CoinTabView()
}
