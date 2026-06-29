import Foundation

final class CoinRepositoryImpl: CoinRepositoryProtocol {
    private let remoteDataSource: CoinPaprikaRemoteDataSourceProtocol

    init(remoteDataSource: CoinPaprikaRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchCoins() async throws -> [Coin] {
        try await remoteDataSource.fetchCoins().map { $0.toDomain() }
    }

    func fetchCoinDetail(coinID: String) async throws -> CoinDetail {
        try await remoteDataSource.fetchCoinDetail(coinID: coinID).toDomain()
    }

    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion {
        try await remoteDataSource.fetchPriceConversion(
            baseCurrencyID: baseCurrencyID,
            quoteCurrencyID: quoteCurrencyID,
            amount: amount
        ).toDomain()
    }
}
