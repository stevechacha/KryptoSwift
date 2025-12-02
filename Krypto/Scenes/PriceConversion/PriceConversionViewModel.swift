//
//  PriceConversionViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 21/12/2024.
//

import Foundation

@MainActor
class PriceConversionViewModel: ObservableObject {
    private let coinServiceProtocol: CoinServiceProtocol
    
    @Published var priceConversion: PriceConversion?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(coinService: CoinServiceProtocol = NetworkManager()) {
        self.coinServiceProtocol = coinService
    }
    
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let result = try await coinServiceProtocol.fetchPriceConversion(
                baseCurrencyID: baseCurrencyID,
                quoteCurrencyID: quoteCurrencyID,
                amount: amount
            )
            self.priceConversion = result
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
