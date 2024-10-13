//
//  Exchange.swift
//  Krypto
//
//  Created by stephen chacha on 09/10/2024.
//

import Foundation

struct Exchange: Codable, Identifiable, Hashable {
    let id: String?                // Unique identifier for the excha
    let name: String?
    let active: Bool?
    let websiteStatus: Bool?
    let apiStatus: Bool?
    let description: String?
    let message: String?
    let links: Links?
    let marketsDataFetched: Bool?
    let adjustedRank: Int?
    let reportedRank: Int?
    let currencies: Int?
    let markets: Int?
    let fiats: [Fiat]?
    let quotes: [String: Quotes]?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case active
        case websiteStatus = "website_status"
        case apiStatus = "api_status"
        case description
        case message
        case links
        case marketsDataFetched = "markets_data_fetched"
        case adjustedRank = "adjusted_rank"
        case reportedRank = "reported_rank"
        case currencies
        case markets
        case fiats
        case quotes
        case lastUpdated = "last_updated"
    }
}


struct Fiat: Codable, Hashable {
    let name: String?
    let symbol: String?
}

struct Quotes: Codable, Hashable {
    let reportedVolume24h: Int?
    let adjustedVolume24h: Int?
    let reportedVolume7d: Int?
    let adjustedVolume7d: Int?
    let reportedVolume30d: Int?
    let adjustedVolume30d: Int?

    enum CodingKeys: String, CodingKey {
        case reportedVolume24h = "reported_volume_24h"
        case adjustedVolume24h = "adjusted_volume_24h"
        case reportedVolume7d = "reported_volume_7d"
        case adjustedVolume7d = "adjusted_volume_7d"
        case reportedVolume30d = "reported_volume_30d"
        case adjustedVolume30d = "adjusted_volume_30d"
    }
}

struct Market: Codable, Identifiable ,Hashable{
    let id: String
    let pair: String
    let baseCurrencyId: String
    let baseCurrencyName: String
    let quoteCurrencyId: String
    let quoteCurrencyName: String
    let marketUrl: String
    let category: String
    let feeType: String
    let outlier: Bool
    let reportedVolume24hShare: Double
    let quotes: [String: Quotes] // Dictionary with dynamic keys (e.g. "$KEY")
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id
        case pair
        case baseCurrencyId = "base_currency_id"
        case baseCurrencyName = "base_currency_name"
        case quoteCurrencyId = "quote_currency_id"
        case quoteCurrencyName = "quote_currency_name"
        case marketUrl = "market_url"
        case category
        case feeType = "fee_type"
        case outlier
        case reportedVolume24hShare = "reported_volume_24h_share"
        case quotes
        case lastUpdated = "last_updated"
    }
}

