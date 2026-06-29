import Foundation

protocol FetchCoinsUseCaseProtocol {
    func execute() async throws -> [Coin]
}

final class FetchCoinsUseCase: FetchCoinsUseCaseProtocol {
    private let repository: CoinRepositoryProtocol

    init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Coin] {
        try await repository.fetchCoins()
    }
}
