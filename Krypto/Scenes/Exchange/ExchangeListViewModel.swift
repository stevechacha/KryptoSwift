//
//  ExchangeListViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import Foundation

@MainActor
class ExchangeListViewModel: ObservableObject {
    @Published var exchanges: [Exchange] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private let coinDataService: CoinServiceProtocol
    
    init(coinService: CoinServiceProtocol = NetworkManager()) {
        self.coinDataService = coinService
    }
    
    func fetchExchanges() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedExchanges = try await coinDataService.fetchExchanges()
            self.exchanges = fetchedExchanges
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
