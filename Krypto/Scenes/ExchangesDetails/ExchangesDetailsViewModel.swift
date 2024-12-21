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
    
    private let exchangeDetailService: CoinServiceProtocol
    
    init(exchangeDetailService: CoinServiceProtocol = NetworkManager()) {
        self.exchangeDetailService = exchangeDetailService
    }
    
    func getExchangeDetail(exchangeID: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let getExchangeDetail = try await exchangeDetailService.getExchangeDetail(exchangeId: exchangeID)
            self.exchangeDetail = getExchangeDetail
        } catch {
            if let exchangeDetailError = error as? CoinAPIError {
                self.errorMessage = exchangeDetailError.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
        
        isLoading = false
    }
    
    
//    func getExchangeDetail(exchangeID: String){
//        isLoading = true
//        exchangeService.getExchangeDetail(exchangeId: exchangeID){ [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case.success(let exchangeDetail):
//                    self?.exchangeDetail = exchangeDetail
//                case.failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
}
