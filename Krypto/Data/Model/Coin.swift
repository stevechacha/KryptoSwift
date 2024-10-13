//
//  CoinDetail.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//



import Foundation

struct Coin: Codable,Identifiable,Hashable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let isNew: Bool
    let isActive: Bool
    let type: String

    
    enum CodingKeys: String, CodingKey {
        case id ,name, symbol, rank,type
        case isNew = "is_new"
        case isActive = "is_active"
    }
}

struct Parent: Codable {
    let id: String
    let name: String
    let symbol: String
}

struct Tag: Codable , Hashable {
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


struct Contract: Codable {
    let contract: String
    let platform: String
    let type: String
}

struct Links: Codable ,Hashable{
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let sourceCode: [String]?
    let website: [String]?
    let twitter: [String]?
    let youtube: [String]?
    let medium: String?

    enum CodingKeys: String, CodingKey {
        case explorer, facebook, reddit
        case sourceCode = "source_code"
        case website, youtube, medium
        case twitter
    }
}

struct LinksExtended: Codable ,Hashable{
    let url: String
    let type: String
    let stats: LinkStats?

    struct LinkStats: Codable,Hashable {
        let subscribers: Int?
        let contributors: Int?
        let stars: Int?
    }
}


