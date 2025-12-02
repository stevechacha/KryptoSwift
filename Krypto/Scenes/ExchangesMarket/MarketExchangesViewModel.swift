//
//  MarketViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 11/10/2024.
//

import Foundation

@MainActor
class MarketExchangesViewModel: ObservableObject {
    @Published var markets: [Market]?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let coinService: CoinServiceProtocol
    
    init(coinService: CoinServiceProtocol = NetworkManager()) {
        self.coinService = coinService
    }
    
    func fetchMarketExchange(for exchangeId: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let marketExchanges = try await coinService.fetchExchangeMarkets(for: exchangeId)
            self.markets = marketExchanges
        } catch {
            if let networkError = error as? CoinNetworkError {
                self.errorMessage = networkError.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
        
        isLoading = false
    }
}
