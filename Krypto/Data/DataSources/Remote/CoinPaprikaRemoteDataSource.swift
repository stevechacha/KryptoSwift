import Foundation

protocol CoinPaprikaRemoteDataSourceProtocol {
    func fetchCoins() async throws -> [CoinDTO]
    func fetchCoinDetail(coinID: String) async throws -> CoinDetailDTO
    func fetchExchanges() async throws -> [ExchangeDTO]
    func fetchExchangeDetail(exchangeID: String) async throws -> ExchangeDetailDTO
    func fetchExchangeMarkets(exchangeID: String) async throws -> [MarketDTO]
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversionDTO
}

final class CoinPaprikaRemoteDataSource: CoinPaprikaRemoteDataSourceProtocol {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol) {
        self.client = client
    }

    func fetchCoins() async throws -> [CoinDTO] {
        try await client.request(endpoint: "coins", queryItems: nil)
    }

    func fetchCoinDetail(coinID: String) async throws -> CoinDetailDTO {
        try await client.request(endpoint: "coins/\(coinID)", queryItems: nil)
    }

    func fetchExchanges() async throws -> [ExchangeDTO] {
        try await client.request(endpoint: "exchanges", queryItems: nil)
    }

    func fetchExchangeDetail(exchangeID: String) async throws -> ExchangeDetailDTO {
        try await client.request(endpoint: "exchanges/\(exchangeID)", queryItems: nil)
    }

    func fetchExchangeMarkets(exchangeID: String) async throws -> [MarketDTO] {
        try await client.request(
            endpoint: "exchanges/\(exchangeID)/markets",
            queryItems: nil
        )
    }

    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversionDTO {
        let queryItems = [
            URLQueryItem(name: "base_currency_id", value: baseCurrencyID),
            URLQueryItem(name: "quote_currency_id", value: quoteCurrencyID),
            URLQueryItem(name: "amount", value: "\(amount)")
        ]

        return try await client.request(
            endpoint: "price-converter",
            queryItems: queryItems
        )
    }
}
