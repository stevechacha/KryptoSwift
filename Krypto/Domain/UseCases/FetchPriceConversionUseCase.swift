import Foundation

protocol FetchPriceConversionUseCaseProtocol {
    func execute(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion
}

final class FetchPriceConversionUseCase: FetchPriceConversionUseCaseProtocol {
    private let repository: CoinRepositoryProtocol

    init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    func execute(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion {
        try await repository.fetchPriceConversion(
            baseCurrencyID: baseCurrencyID,
            quoteCurrencyID: quoteCurrencyID,
            amount: amount
        )
    }
}
