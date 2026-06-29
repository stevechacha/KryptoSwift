import Foundation

final class ExchangeRepositoryImpl: ExchangeRepositoryProtocol {
    private let remoteDataSource: CoinPaprikaRemoteDataSourceProtocol

    init(remoteDataSource: CoinPaprikaRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchExchanges() async throws -> [Exchange] {
        try await remoteDataSource.fetchExchanges().map { $0.toDomain() }
    }

    func fetchExchangeDetail(exchangeID: String) async throws -> ExchangeDetail {
        try await remoteDataSource.fetchExchangeDetail(exchangeID: exchangeID).toDomain()
    }

    func fetchExchangeMarkets(exchangeID: String) async throws -> [Market] {
        try await remoteDataSource.fetchExchangeMarkets(exchangeID: exchangeID).map { $0.toDomain() }
    }
}
