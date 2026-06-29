import Foundation

struct ExchangeDTO: Codable {
    let id: String
    let name: String?
    let active: Bool
    let websiteStatus: Bool
    let apiStatus: Bool
    let description: String?
    let message: String?
    let links: ExchangeLinksDTO?
    let marketsDataFetched: Bool
    let adjustedRank: Int?
    let reportedRank: Int?
    let currencies: Int?
    let markets: Int?
    let fiats: [FiatDTO]
    let quotes: [String: ExchangeQuoteDTO]?
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

struct ExchangeDetailDTO: Codable {
    let id: String?
    let name: String
    let active: Bool
    let websiteStatus: Bool
    let apiStatus: Bool
    let description: String?
    let message: String?
    let links: ExchangeLinksDTO?
    let marketsDataFetched: Bool
    let adjustedRank: Int?
    let reportedRank: Int?
    let currencies: Int
    let markets: Int
    let fiats: [FiatDTO]
    let quotes: [String: ExchangeQuoteDTO]
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

struct FiatDTO: Codable {
    let name: String
    let symbol: String
}

struct ExchangeLinksDTO: Codable {
    let twitter: [String]?
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let sourceCode: [String]?
    let website: [String]?
    let youtube: [String]?
    let medium: String?

    enum CodingKeys: String, CodingKey {
        case explorer, facebook, reddit, twitter
        case sourceCode = "source_code"
        case website, youtube, medium
    }
}

struct ExchangeQuoteDTO: Codable {
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
