import Foundation

protocol FetchExchangeDetailUseCaseProtocol {
    func execute(exchangeID: String) async throws -> ExchangeDetail
}

final class FetchExchangeDetailUseCase: FetchExchangeDetailUseCaseProtocol {
    private let repository: ExchangeRepositoryProtocol

    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }

    func execute(exchangeID: String) async throws -> ExchangeDetail {
        try await repository.fetchExchangeDetail(exchangeID: exchangeID)
    }
}
