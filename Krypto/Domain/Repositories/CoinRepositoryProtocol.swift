import Foundation

protocol CoinRepositoryProtocol {
    func fetchCoins() async throws -> [Coin]
    func fetchCoinDetail(coinID: String) async throws -> CoinDetail
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion
}
