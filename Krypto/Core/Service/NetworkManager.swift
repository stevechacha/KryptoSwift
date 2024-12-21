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
    
    private let baseUrl = "https://api.coinpaprika.com/v1/"
    
    private let decoder: JSONDecoder
    
    init() {
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .useDefaultKeys
        decoder.dateDecodingStrategy = .iso8601 // If using Date type for lastUpdated
    }
    
    func fetchCoins() async throws -> [Coin] {
        let coinUrl = baseUrl+"coins"
        guard let url = URL(string: coinUrl) else {
            throw CoinNetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw CoinNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            // Debugging: Print received JSON
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            
            do {
                let coins = try decoder.decode([Coin].self, from: data)
                return coins
            } catch let decodingError as DecodingError {
                print("Decoding Error: \(decodingError)")
                throw CoinNetworkError.decodeDataError
            }
            
        } catch let error as CoinNetworkError {
            throw error
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    func fetchCoinDetail(coinID: String) async throws -> CoinDetail {
        let coinDetailUrl = (baseUrl) + "coins/\(coinID)"
        guard let url = URL(string: coinDetailUrl) else {
            throw CoinNetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw CoinNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            
            // Debugging: Print received JSON
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            
            do {
                let coinDetail = try decoder.decode(CoinDetail.self, from: data)
                print(coinDetail)
                return coinDetail
            } catch let decodingError as DecodingError {
                print("Decoding Error: \(decodingError)")
                throw CoinNetworkError.decodeDataError
            }
        } catch let error as CoinNetworkError {
            throw error
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    
    
    func fetchExchanges() async throws -> [Exchange] {
        let exchangeUrl = baseUrl + "/exchanges"
        guard let url = URL(string: exchangeUrl) else {
            throw CoinNetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw CoinNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            
            // Debug: Print the raw JSON response
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            
            do {
                let exchanges = try decoder.decode([Exchange].self, from: data)
                return exchanges
            } catch let decodingError as DecodingError {
                print("Decoding Error: \(decodingError)")
                throw CoinNetworkError.decodeDataError
            }
            
        } catch let error as CoinNetworkError {
            throw error
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    
    
    func getExchangeDetail(exchangeId: String) async throws -> ExchangeDetail {
        let exchangeDetailUrl = baseUrl + "exchanges/\(exchangeId)"
        guard let url = URL(string: exchangeDetailUrl) else {
            throw CoinNetworkError.invalidURL
        }
        
        
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw CoinNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            // Debug: Print the raw JSON response
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            
            do {
                let decoder: JSONDecoder = JSONDecoder()
                let exchangeDetail = try decoder.decode(ExchangeDetail.self, from: data)
                return exchangeDetail
            }  catch let decodingError as DecodingError {
                print("Decoding Error: \(decodingError)")
                throw CoinNetworkError.decodeDataError
            }
            
            
        } catch let error as CoinNetworkError {
            throw error
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    
    
    func fetchPriceConversion(
        baseCurrencyID: String,
        quoteCurrencyID: String,
        amount: Double
    ) async throws -> PriceConversion {
        let priceConversationUrl = baseUrl + "price-converter"
        guard var urlComponents = URLComponents(string: priceConversationUrl) else {
            throw CoinNetworkError.invalidURL
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "base_currency_id", value: baseCurrencyID),
            URLQueryItem(name: "quote_currency_id", value: quoteCurrencyID),
            URLQueryItem(name: "amount", value: "\(amount)")
        ]
        
        guard let url = urlComponents.url else {
            throw CoinNetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw CoinNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            
            do {
                let priceConversion = try JSONDecoder().decode(PriceConversion.self, from: data)
                return priceConversion
            } catch {
                throw CoinNetworkError.decodeDataError
            }
            
        } catch let error as CoinNetworkError {
            throw error
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    
    
    func fetchExchangeMarkets(for exchangeId: String) async throws -> [Market] {
        let marketUrl = baseUrl + "exchanges/\(exchangeId)/markets"
        guard let url = URL(string: marketUrl) else {
            throw CoinNetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw CoinNetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            let decoder: JSONDecoder = JSONDecoder()
            let markets = try decoder.decode([Market].self, from: data)
            return markets
        } catch let error as CoinAPIError {
            throw error
        } catch {
            throw CoinNetworkError.unableToComplete(description: error.localizedDescription)
        }
    }
    
}
