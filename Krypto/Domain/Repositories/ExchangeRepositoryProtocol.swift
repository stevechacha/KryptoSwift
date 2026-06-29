import Foundation

protocol ExchangeRepositoryProtocol {
    func fetchExchanges() async throws -> [Exchange]
    func fetchExchangeDetail(exchangeID: String) async throws -> ExchangeDetail
    func fetchExchangeMarkets(exchangeID: String) async throws -> [Market]
}
