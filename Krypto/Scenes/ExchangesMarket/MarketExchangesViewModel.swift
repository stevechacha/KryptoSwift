//
//  MarketViewModel.swift
//  Krypto
//
//  Created by stephen chacha on 11/10/2024.
//

import Foundation

class MarketExchangesViewModel : ObservableObject {
    @Published var markets: [Market] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var exchangeId: String?
    
    private let coinservice : CoinServiceProtocol
    
    init(coinservice: CoinServiceProtocol = NetworkManager()) {
        self.coinservice = coinservice
    }
    
    
    
    @MainActor
    func fetchMarketExchange(for exchangeId: String) async {
        isLoading = true
        errorMessage = nil

        do {
            let marketExchanges = try await coinservice.fetchExchangeMarkets(for: exchangeId)
            self.markets = marketExchanges
        } catch {
            if let marketError = error as? CoinAPIError {
                self.errorMessage = marketError.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }

        }
        isLoading = false

    }
   
//    func fetchMarketExchange(for exchangeId: String){
//        isLoading = true
//        errorMessage = nil
//        
//        coinservice.getExchangeMarket(exchangeId: exchangeId){ [weak self] result in
//            switch result {
//            case.success(let markets):
//                self?.markets = markets
//                self?.isLoading = false
//            case.failure(let error):
//                self?.errorMessage = error.localizedDescription
//                self?.isLoading = false
//            }
//
//        }
//        
//    }
}
