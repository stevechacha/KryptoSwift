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
    @Published var isLoading: Bool = false
    
//    private let service = CoinDataService()
//
//    init() {
//        Task { try await fetchCoins() }
//    }
//
//    @MainActor
//    func fetchCoins() async throws {
//        self.coins = try await service.fetchCoins()
//    }
//
//    func fetchCoinWithResult(){
//        isLoading = true
//        service.fetchCoinsWithResult { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let coins):
//                    self?.coins = coins
//                    self?.isLoading = false
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                    self?.isLoading = false
//                }
//            }
//        }
//    }

    
    private let coinService: CoinServiceProtocol
    
    init(coinServie: CoinServiceProtocol = NetworkManager()) {
        self.coinService = coinServie
    }
    
    func fetchCoinWithResult() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchCoins = try await coinService.fetchCoins()
            self.coins = fetchCoins
        } catch{
            if let coinError = error as? CoinAPIError {
                self.errorMessage = coinError.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
        isLoading = false

    }
}
