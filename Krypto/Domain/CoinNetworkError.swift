//
//  CoinNetworkError.swift
//  Krypto
//
//  Created by stephen chacha on 16/10/2024.
//

import Foundation

enum CoinNetworkError: LocalizedError {
    case invalidURL
    case invalidResponse(statusCode: Int)
    case decodingError
    case unableToComplete(description: String)
    case unknownError(error: Error)
    case jsonParsingFailure
    case decodeDataError

    var errorDescription: String? {
        switch self {
        case .decodeDataError: return "Failed to decode data"
        case .invalidURL:
            return "The URL provided was invalid."
        case .invalidResponse(let statusCode):
            return "Received invalid response from server with status code \(statusCode)."
        case .decodingError:
            return "Failed to decode the response."
        case .unableToComplete(let description):
            return "Unable to complete the request: \(description)"
        case .unknownError(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        case .jsonParsingFailure:
            return "Failed to parse JSON data."
        }
        
    }
}
