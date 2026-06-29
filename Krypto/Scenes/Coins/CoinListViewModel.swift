//
//  CoinViewModel.swift
//  Krypto
//

import Foundation

@MainActor
final class CoinListViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let fetchCoinsUseCase: FetchCoinsUseCaseProtocol

    init(fetchCoinsUseCase: FetchCoinsUseCaseProtocol = DependencyContainer.shared.makeFetchCoinsUseCase()) {
        self.fetchCoinsUseCase = fetchCoinsUseCase
    }

    func fetchCoinWithResult() async {
        isLoading = true
        errorMessage = nil

        do {
            coins = try await fetchCoinsUseCase.execute()
        } catch {
            errorMessage = ViewModelErrorMapper.message(from: error)
        }

        isLoading = false
    }
}
