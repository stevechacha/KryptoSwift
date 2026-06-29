import Foundation

struct MarketDTO: Codable {
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
    let quotes: [String: MarketQuoteDTO]
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

struct MarketQuoteDTO: Codable {
    let price: Double
    let volume24h: Double

    enum CodingKeys: String, CodingKey {
        case price
        case volume24h = "volume_24h"
    }
}
