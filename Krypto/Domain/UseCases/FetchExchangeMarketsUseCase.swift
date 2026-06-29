import Foundation

protocol FetchExchangeMarketsUseCaseProtocol {
    func execute(exchangeID: String) async throws -> [Market]
}

final class FetchExchangeMarketsUseCase: FetchExchangeMarketsUseCaseProtocol {
    private let repository: ExchangeRepositoryProtocol

    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }

    func execute(exchangeID: String) async throws -> [Market] {
        try await repository.fetchExchangeMarkets(exchangeID: exchangeID)
    }
}
