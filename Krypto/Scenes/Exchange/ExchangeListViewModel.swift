//
//  ExchangeListViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import Foundation

class ExchangeListViewModel : ObservableObject {
    @Published var exchanges: [Exchange] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
        
    private let coinDataService = CoinDataService()
        
        func fetchExchanges() {
            isLoading = true
            errorMessage = nil
            
            coinDataService.getExchanges { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success(let exchanges):
                        self?.exchanges = exchanges
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }


}
