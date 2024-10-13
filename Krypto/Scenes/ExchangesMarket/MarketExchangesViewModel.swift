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
    
    private let coinservice = CoinDataService()
    
    

   
    func fetchMarketExchange(for exchangeId: String){
        isLoading = true
        errorMessage = nil
        
        coinservice.getExchangeMarket(exchangeId: exchangeId){ [weak self] result in
            switch result {
            case.success(let markets):
                self?.markets = markets
                self?.isLoading = false
            case.failure(let error):
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }

        }
        
    }
}
