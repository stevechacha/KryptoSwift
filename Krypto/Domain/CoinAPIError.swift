//
//  CoinAPIError.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data received from the server."
        case .jsonParsingFailure: return "Failed to parse the JSON response."
        case .requestFailed(let description): return "Request failed: \(description)"
        case .invalidStatusCode(let statusCode): return "Invalid status code received: \(statusCode)"
        case .unknownError(let error): return "An unknown error occurred: \(error.localizedDescription)"
        }
    }
}

