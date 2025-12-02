//
//  CoinViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 06/10/2024.
//

import Foundation

@MainActor
class CoinListViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let coinService: CoinServiceProtocol
    
    init(coinService: CoinServiceProtocol = NetworkManager()) {
        self.coinService = coinService
    }
    
    func fetchCoinWithResult() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedCoins = try await coinService.fetchCoins()
            self.coins = fetchedCoins
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
