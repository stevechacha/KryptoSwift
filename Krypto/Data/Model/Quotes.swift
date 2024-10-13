//
//  Quotes.swift
//  Krypto
//
//  Created by stephen chacha on 13/10/2024.
//



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
