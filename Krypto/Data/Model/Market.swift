//
//  Market.swift
//  Krypto
//
//  Created by stephen chacha on 13/10/2024.
//



struct Market: Codable {
    let pair: String
    let baseCurrencyID: String
    let baseCurrencyName: String
    let quoteCurrencyID: String
    let quoteCurrencyName: String
    let marketURL: String
    let category: String
    let feeType: String
    let outlier: Bool
    let reportedVolume24hShare: Double
    let quotes: [String: MarketsQuote]
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case pair
        case baseCurrencyID = "base_currency_id"
        case baseCurrencyName = "base_currency_name"
        case quoteCurrencyID = "quote_currency_id"
        case quoteCurrencyName = "quote_currency_name"
        case marketURL = "market_url"
        case category
        case feeType = "fee_type"
        case outlier
        case reportedVolume24hShare = "reported_volume_24h_share"
        case quotes
        case lastUpdated = "last_updated"
    }
}

struct MarketsQuote: Codable {
    let price: Double
    let volume24h: Double

    enum CodingKeys: String, CodingKey {
        case price
        case volume24h = "volume_24h"
    }
}

struct MarketLinks: Codable,Hashable {
    let explorer: [String]?
    let website: [String]?
    let twitter: [String]?
}


// MARK: - Quote
struct MarketQuote: Codable, Hashable {
    let reportedVolume24H: Double
    let adjustedVolume24H: Double
    let reportedVolume7D: Double
    let adjustedVolume7D: Double
    let reportedVolume30D: Double
    let adjustedVolume30D: Double

    enum CodingKeys: String, CodingKey {
        case reportedVolume24H = "reported_volume_24h"
        case adjustedVolume24H = "adjusted_volume_24h"
        case reportedVolume7D = "reported_volume_7d"
        case adjustedVolume7D = "adjusted_volume_7d"
        case reportedVolume30D = "reported_volume_30d"
        case adjustedVolume30D = "adjusted_volume_30d"
    }
}
