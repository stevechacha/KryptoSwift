//
//  ExchangesDetailsViewModel.swift
//  Krypto
//

import Foundation

@MainActor
final class ExchangesDetailsViewModel: ObservableObject {
    @Published var exchangeDetail: ExchangeDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchExchangeDetailUseCase: FetchExchangeDetailUseCaseProtocol

    init(
        fetchExchangeDetailUseCase: FetchExchangeDetailUseCaseProtocol = DependencyContainer.shared.makeFetchExchangeDetailUseCase()
    ) {
        self.fetchExchangeDetailUseCase = fetchExchangeDetailUseCase
    }

    func getExchangeDetail(exchangeID: String) async {
        isLoading = true
        errorMessage = nil

        do {
            exchangeDetail = try await fetchExchangeDetailUseCase.execute(exchangeID: exchangeID)
        } catch {
            errorMessage = ViewModelErrorMapper.message(from: error)
        }

        isLoading = false
    }
}
