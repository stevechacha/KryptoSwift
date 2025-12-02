//
//  NetworkManager.swift
//  Krypto
//
//  Created by stephen chacha on 16/10/2024.
//

import Foundation

protocol CoinServiceProtocol {
    func fetchCoins() async throws -> [Coin]
    func fetchCoinDetail(coinID: String) async throws -> CoinDetail
    func fetchExchanges() async throws -> [Exchange]
    func getExchangeDetail(exchangeId: String) async throws -> ExchangeDetail
    func fetchExchangeMarkets(for exchangeId: String) async throws -> [Market]
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion
}

class NetworkManager: CoinServiceProtocol {
    
    private let baseURL = "https://api.coinpaprika.com/v1"
    private let decoder: JSONDecoder
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .useDefaultKeys
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    // MARK: - Generic Request Method
    
    private func performRequest<T: Decodable>(
        endpoint: String,
        queryItems: [URLQueryItem]? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard var urlComponents = URLComponents(string: "\(baseURL)/\(endpoint)") else {
            throw CoinNetworkError.invalidURL
        }
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw CoinNetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw CoinNetworkError.invalidResponse(
                statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1
            )
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            throw CoinNetworkError.decodeDataError
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    
    func fetchCoins() async throws -> [Coin] {
        return try await performRequest(
            endpoint: "coins",
            responseType: [Coin].self
        )
    }
    func fetchCoinDetail(coinID: String) async throws -> CoinDetail {
        return try await performRequest(
            endpoint: "coins/\(coinID)",
            responseType: CoinDetail.self
        )
    }
    
    
    func fetchExchanges() async throws -> [Exchange] {
        return try await performRequest(
            endpoint: "exchanges",
            responseType: [Exchange].self
        )
    }
    
    
    func getExchangeDetail(exchangeId: String) async throws -> ExchangeDetail {
        return try await performRequest(
            endpoint: "exchanges/\(exchangeId)",
            responseType: ExchangeDetail.self
        )
    }
    
    
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion {
        let queryItems = [
            URLQueryItem(name: "base_currency_id", value: baseCurrencyID),
            URLQueryItem(name: "quote_currency_id", value: quoteCurrencyID),
            URLQueryItem(name: "amount", value: "\(amount)")
        ]
        
        return try await performRequest(
            endpoint: "price-converter",
            queryItems: queryItems,
            responseType: PriceConversion.self
        )
    }
    
    
    func fetchExchangeMarkets(for exchangeId: String) async throws -> [Market] {
        return try await performRequest(
            endpoint: "exchanges/\(exchangeId)/markets",
            responseType: [Market].self
        )
    }
}
