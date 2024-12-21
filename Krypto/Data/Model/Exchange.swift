//
//  Exchange.swift
//  Krypto
//
//  Created by stephen chacha on 09/10/2024.
//

import Foundation


// MARK: - Exchange
struct Exchange: Codable, Identifiable,Hashable{
    let id: String
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
    let quotes: [String: Quote]?
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

// MARK: - Fiat
struct Fiat: Codable, Hashable {
    let name: String
    let symbol: String
}

// MARK: - Links
struct ExchangeLinks: Codable, Hashable {
    let twitter: [String]?
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let sourceCode: [String]?
    let website: [String]?
    let youtube: [String]?
    let medium: String?

    enum CodingKeys: String, CodingKey {
        case explorer, facebook, reddit,twitter
        case sourceCode = "source_code"
        case website, youtube, medium
    }


}

// MARK: - Quote
struct Quote: Codable, Hashable {
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




