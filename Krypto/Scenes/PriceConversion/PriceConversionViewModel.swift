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
    
    // Published properties to update the UI
    @Published var priceConversion: PriceConversion? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // Initializer with dependency injection
    init(priceConversion: CoinServiceProtocol = NetworkManager()) {
        self.coinServiceProtocol = priceConversion
    }
    
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async {
        // Set loading state
        isLoading = true
        errorMessage = nil
        
        do {
            // Call the service method to fetch price conversion
            let result = try await coinServiceProtocol.fetchPriceConversion(
                baseCurrencyID: baseCurrencyID,
                quoteCurrencyID: quoteCurrencyID,
                amount: amount
            )
            // Update the priceConversion property
            self.priceConversion = result
        } catch {
            if let priceConversionError = error as? CoinAPIError {
                self.errorMessage = priceConversionError.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
        isLoading = false
    }
    
}
