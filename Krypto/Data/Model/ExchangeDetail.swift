//
//  ExchangeDetail.swift
//  Krypto
//
//  Created by stephen chacha on 10/10/2024.
//

import Foundation

// MARK: - ExchangeDetail
struct ExchangeDetail: Codable, Hashable {
    let id: String?
    let name: String
    let active: Bool
    let websiteStatus: Bool
    let apiStatus: Bool
    let description: String?
    let message: String?
    let links: ExchangeLinks?
    let marketsDataFetched: Bool
    let adjustedRank: Int?
    let reportedRank: Int?
    let currencies: Int
    let markets: Int
    let fiats: [Fiat]
    let quotes: [String: Quote]
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, name, active
        case websiteStatus = "website_status"
        case apiStatus = "api_status"
        case description, message, links
        case marketsDataFetched = "markets_data_fetched"
        case adjustedRank = "adjusted_rank"
        case reportedRank = "reported_rank"
        case currencies, markets, fiats, quotes
        case lastUpdated = "last_updated"
    }
}

