//
//  CoinDetailViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import Foundation

class CoinDetailViewModel: ObservableObject {
    @Published var coinDetail: CoinDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    

    private let coinService: CoinServiceProtocol
    
    init(coinService: CoinServiceProtocol = NetworkManager()) {
        self.coinService = coinService
    }
    
    @MainActor
    func fetchCoinDetail(coinID: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let coinDetails = try await coinService.fetchCoinDetail(coinID: coinID)
            self.coinDetail = coinDetails
        } catch {
            if let coinDetailError  = error as? CoinAPIError {
                self.errorMessage = coinDetailError.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
        isLoading = false
       
    }
    



    
}
