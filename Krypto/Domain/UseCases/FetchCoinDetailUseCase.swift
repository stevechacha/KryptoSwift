import Foundation

protocol FetchCoinDetailUseCaseProtocol {
    func execute(coinID: String) async throws -> CoinDetail
}

final class FetchCoinDetailUseCase: FetchCoinDetailUseCaseProtocol {
    private let repository: CoinRepositoryProtocol

    init(repository: CoinRepositoryProtocol) {
        self.repository = repository
    }

    func execute(coinID: String) async throws -> CoinDetail {
        try await repository.fetchCoinDetail(coinID: coinID)
    }
}
