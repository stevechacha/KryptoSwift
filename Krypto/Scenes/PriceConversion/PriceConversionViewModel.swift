//
//  PriceConversionViewModel.swift
//  Krypto
//

import Foundation

@MainActor
final class PriceConversionViewModel: ObservableObject {
    @Published var priceConversion: PriceConversion?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let fetchPriceConversionUseCase: FetchPriceConversionUseCaseProtocol

    init(
        fetchPriceConversionUseCase: FetchPriceConversionUseCaseProtocol = DependencyContainer.shared.makeFetchPriceConversionUseCase()
    ) {
        self.fetchPriceConversionUseCase = fetchPriceConversionUseCase
    }

    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async {
        isLoading = true
        errorMessage = nil

        do {
            priceConversion = try await fetchPriceConversionUseCase.execute(
                baseCurrencyID: baseCurrencyID,
                quoteCurrencyID: quoteCurrencyID,
                amount: amount
            )
        } catch {
            errorMessage = ViewModelErrorMapper.message(from: error)
        }

        isLoading = false
    }
}
