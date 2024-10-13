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



