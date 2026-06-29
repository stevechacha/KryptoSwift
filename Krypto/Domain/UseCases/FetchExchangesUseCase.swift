import Foundation

protocol FetchExchangesUseCaseProtocol {
    func execute() async throws -> [Exchange]
}

final class FetchExchangesUseCase: FetchExchangesUseCaseProtocol {
    private let repository: ExchangeRepositoryProtocol

    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Exchange] {
        try await repository.fetchExchanges()
    }
}
