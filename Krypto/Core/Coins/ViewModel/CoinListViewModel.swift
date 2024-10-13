//
//  CoinViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 06/10/2024.
//

import Foundation

class CoinListViewModel : ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        Task { try await fetchCoins() }
    }
    
    
    func fetchCoins() async throws {
        self.coins = try await service.fetchCoins()
    }
    

    
    func fetchCoinWithResult(){
        service.fetchCoinsWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
