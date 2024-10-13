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

    private let coinService = CoinDataService()

    func fetchCoinDetail(coinID: String) {
        isLoading = true
        coinService.fetchCoinDetail(coinID: coinID) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let coinDetail):
                    self?.coinDetail = coinDetail
                case .failure(let error):
                    self?.errorMessage = error.customDescription
                }
            }
        }
    }
}
