//
//  CoinDetail.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//


import Foundation


// MARK: - CoinDetail
struct CoinDetail: Codable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let description: String?
    let startedAt: String?
    let hashAlgorithm: String
    let contract: String? // Make it optional
    let links: Links?
    let whitepaper: Whitepaper?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank, description
        case startedAt = "started_at"
        case hashAlgorithm = "hash_algorithm"
        case contract
        case links, whitepaper
    }

}

// MARK: - Contract
struct Contract: Codable {
    let contract: String
    let platform: String
    let type: String
}

struct Links: Codable {
    let explorer: [String]?
    let website: [String]?
    let twitter: [String]?
}


// MARK: - LinksExtended
struct LinksExtended: Codable {
    let url: String
    let type: String
    let stats: Stats?
}

// MARK: - Stats
struct Stats: Codable {
    let subscribers: Int?
    let contributors: Int?
    let stars: Int?
}

// MARK: - Parent
struct Parent: Codable {
    let id: String
    let name: String
    let symbol: String
}

// MARK: - Tag
struct Tag: Codable {
    let id: String
    let name: String
    let coinCounter: Int
    let icoCounter: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case coinCounter = "coin_counter"
        case icoCounter = "ico_counter"
    }
}

// MARK: - TeamMember
struct TeamMember: Codable {
    let id: String
    let name: String
    let position: String
}

// MARK: - Whitepaper
struct Whitepaper: Codable {
    let link: String?
    let thumbnail: String?
}




