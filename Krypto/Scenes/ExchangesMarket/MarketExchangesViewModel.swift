//
//  MarketViewModel.swift
//  Krypto
//

import Foundation

@MainActor
final class MarketExchangesViewModel: ObservableObject {
    @Published var markets: [Market]?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchExchangeMarketsUseCase: FetchExchangeMarketsUseCaseProtocol

    init(
        fetchExchangeMarketsUseCase: FetchExchangeMarketsUseCaseProtocol = DependencyContainer.shared.makeFetchExchangeMarketsUseCase()
    ) {
        self.fetchExchangeMarketsUseCase = fetchExchangeMarketsUseCase
    }

    func fetchMarketExchange(for exchangeId: String) async {
        isLoading = true
        errorMessage = nil

        do {
            markets = try await fetchExchangeMarketsUseCase.execute(exchangeID: exchangeId)
        } catch {
            errorMessage = ViewModelErrorMapper.message(from: error)
        }

        isLoading = false
    }
}
