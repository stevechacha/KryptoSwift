import Foundation

final class DependencyContainer {
    static let shared = DependencyContainer()

    private let networkClient: NetworkClientProtocol
    private let remoteDataSource: CoinPaprikaRemoteDataSourceProtocol
    private let coinRepository: CoinRepositoryProtocol
    private let exchangeRepository: ExchangeRepositoryProtocol

    init(session: URLSession = .shared) {
        networkClient = NetworkClient(session: session)
        remoteDataSource = CoinPaprikaRemoteDataSource(client: networkClient)
        coinRepository = CoinRepositoryImpl(remoteDataSource: remoteDataSource)
        exchangeRepository = ExchangeRepositoryImpl(remoteDataSource: remoteDataSource)
    }

    func makeFetchCoinsUseCase() -> FetchCoinsUseCaseProtocol {
        FetchCoinsUseCase(repository: coinRepository)
    }

    func makeFetchCoinDetailUseCase() -> FetchCoinDetailUseCaseProtocol {
        FetchCoinDetailUseCase(repository: coinRepository)
    }

    func makeFetchExchangesUseCase() -> FetchExchangesUseCaseProtocol {
        FetchExchangesUseCase(repository: exchangeRepository)
    }

    func makeFetchExchangeDetailUseCase() -> FetchExchangeDetailUseCaseProtocol {
        FetchExchangeDetailUseCase(repository: exchangeRepository)
    }

    func makeFetchExchangeMarketsUseCase() -> FetchExchangeMarketsUseCaseProtocol {
        FetchExchangeMarketsUseCase(repository: exchangeRepository)
    }

    func makeFetchPriceConversionUseCase() -> FetchPriceConversionUseCaseProtocol {
        FetchPriceConversionUseCase(repository: coinRepository)
    }
}
