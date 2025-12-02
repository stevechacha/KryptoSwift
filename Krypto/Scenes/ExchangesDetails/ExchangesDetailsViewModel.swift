//
//  ExchangesDetailsViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 10/10/2024.
//

import Foundation

@MainActor
class ExchangesDetailsViewModel: ObservableObject {
    @Published var exchangeDetail: ExchangeDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let exchangeDetailService: CoinServiceProtocol
    
    init(exchangeDetailService: CoinServiceProtocol = NetworkManager()) {
        self.exchangeDetailService = exchangeDetailService
    }
    
    func getExchangeDetail(exchangeID: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedExchangeDetail = try await exchangeDetailService.getExchangeDetail(exchangeId: exchangeID)
            self.exchangeDetail = fetchedExchangeDetail
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
