//
//  CoinDataService.swift
//  Krypto
//
//  Created by stephen chacha on 06/10/2024.
//

import Foundation

class CoinDataService {
    private let baseUrl = "https://api.coinpaprika.com/v1"


    func fetchCoins() async throws -> [Coin]{
        let coinUrl = "\(baseUrl)/coins"
        guard let url = URL(string: coinUrl) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return coins
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }

    
    func fetchExchanges() async throws -> [Exchange]{
        let exchangeUrl = "\(baseUrl)/exchanges"
        guard let url = URL(string: exchangeUrl) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let exchanges = try JSONDecoder().decode([Exchange].self, from: data)
            return exchanges
        } catch {
            print("DEBUG: Error fetching exchanges - \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchMarketExchanges(for exchangeId: String) async throws -> [Market]{
        let marketUrl = "\(baseUrl)/exchanges/\(exchangeId)/markets"
        guard let url = URL(string: marketUrl) else { return [] }
    
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let market = try JSONDecoder().decode([Market].self, from: data)
            return market
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
        
}


extension  CoinDataService {
    func fetchCoinsWithResult(completion: @escaping(Result<[Coin], CoinAPIError>) -> Void){
        let urlStrings = "https://api.coinpaprika.com/v1/coins"
        guard let url = URL(string: urlStrings) else {
            completion(.failure(.requestFailed(description: "Unknown error")))
            return
        }

        URLSession.shared.dataTask(with: url) { data , response , error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let coins = try decoder.decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
            
        }.resume()
    }
    
    func fetchCoinDetail(coinID: String, completion: @escaping(Result<CoinDetail, CoinAPIError>) -> Void) {
        let urlString = "\(baseUrl)/coins/\(coinID)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.requestFailed(description: "Invalid URL")))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }

    
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decorder = JSONDecoder()
                decorder.keyDecodingStrategy = .useDefaultKeys
                let coinDetail = try JSONDecoder().decode(CoinDetail.self, from: data)
                completion(.success(coinDetail))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
            
        }.resume()
    }
    
    
    func getExchanges(completion: @escaping(Result<[Exchange], CoinAPIError>) -> Void) {
        let exchangeUrl = "\(baseUrl)/exchanges"
        guard let url = URL(string: exchangeUrl) else {
            completion(.failure(.requestFailed(description: "Invalid URL")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(description: error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.requestFailed(description: "Invalid Response")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let exchanges = try decoder.decode([Exchange].self, from: data)
                completion(.success(exchanges))
            
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
        }

        task.resume()

    }
    
    func getExchangeDetail(exchangeId: String, completion: @escaping(Result<ExchangeDetail,CoinAPIError>)->Void ){
        let exchangeUrlID = "\(baseUrl)/exchanges/\(exchangeId)"
        guard let url = URL(string: exchangeUrlID) else {
            completion(.failure(.requestFailed(description: "Invalid URL")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(description: error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.requestFailed(description: "Invalid Response")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let exchangeDetails = try decoder.decode(ExchangeDetail.self, from: data)
                completion(.success(exchangeDetails))
            
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
        }

        task.resume()

    }
    
    
    func getExchangeMarket(exchangeId: String, completion: @escaping(Result<[Market],CoinAPIError>)->Void){
        let marketUrl = "\(baseUrl)/exchanges/\(exchangeId)/markets"
        guard let url = URL(string: marketUrl) else {
            completion(.failure(.requestFailed(description: "Invalid Url")))
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data , response , error in
            if let error = error {
                completion(.failure(.requestFailed(description: "Invalid Response")))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy =  .convertFromSnakeCase
                let exchanges = try decoder.decode([Market].self, from: data)
                completion(.success(exchanges))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
        }
        task.resume()
            
    }

    

}
