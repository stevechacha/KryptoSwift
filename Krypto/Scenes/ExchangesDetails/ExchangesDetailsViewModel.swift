//
//  ExchangesDetailsViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 10/10/2024.
//

import Foundation


class ExchangesDetailsViewModel : ObservableObject {
    @Published var exchangeDetail: ExchangeDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let exchangeService = CoinDataService()
    
    
    func getExchangeDetail(exchangeID: String){
        isLoading = true
        exchangeService.getExchangeDetail(exchangeId: exchangeID){ [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case.success(let exchangeDetail):
                    self?.exchangeDetail = exchangeDetail
                case.failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
