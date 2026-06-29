//
//  CoinDetailViewModel.swift
//  Krypto
//

import Foundation

@MainActor
final class CoinDetailViewModel: ObservableObject {
    @Published var coinDetail: CoinDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchCoinDetailUseCase: FetchCoinDetailUseCaseProtocol

    init(fetchCoinDetailUseCase: FetchCoinDetailUseCaseProtocol = DependencyContainer.shared.makeFetchCoinDetailUseCase()) {
        self.fetchCoinDetailUseCase = fetchCoinDetailUseCase
    }

    func fetchCoinDetail(coinID: String) async {
        isLoading = true
        errorMessage = nil

        do {
            coinDetail = try await fetchCoinDetailUseCase.execute(coinID: coinID)
        } catch {
            errorMessage = ViewModelErrorMapper.message(from: error)
        }

        isLoading = false
    }
}
