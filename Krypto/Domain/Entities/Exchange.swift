import Foundation

struct Exchange: Identifiable, Hashable {
    let id: String
    let name: String?
    let active: Bool
    let websiteStatus: Bool
    let apiStatus: Bool
    let description: String?
    let message: String?
    let links: ExchangeLinks?
    let marketsDataFetched: Bool
    let adjustedRank: Int?
    let reportedRank: Int?
    let currencies: Int?
    let markets: Int?
    let fiats: [Fiat]
    let quotes: [String: ExchangeQuote]?
    let lastUpdated: String
}

struct Fiat: Hashable {
    let name: String
    let symbol: String
}

struct ExchangeLinks: Hashable {
    let twitter: [String]?
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let sourceCode: [String]?
    let website: [String]?
    let youtube: [String]?
    let medium: String?
}

struct ExchangeQuote: Hashable {
    let reportedVolume24H: Double
    let adjustedVolume24H: Double
    let reportedVolume7D: Double
    let adjustedVolume7D: Double
    let reportedVolume30D: Double
    let adjustedVolume30D: Double
}

struct ExchangeDetail: Hashable {
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
    let quotes: [String: ExchangeQuote]
    let lastUpdated: String
}
