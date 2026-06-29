import Foundation

struct Market: Hashable {
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
    let quotes: [String: MarketQuote]
    let lastUpdated: String
}

struct MarketQuote: Hashable {
    let price: Double
    let volume24h: Double
}
