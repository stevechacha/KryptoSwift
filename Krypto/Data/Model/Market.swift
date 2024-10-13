//
//  Market.swift
//  Krypto
//
//  Created by stephen chacha on 13/10/2024.
//



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
