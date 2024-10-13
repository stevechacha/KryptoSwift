//
//  CoinDetail.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//



import Foundation

//struct Coinss: Codable, Identifiable {
//    let id: String
//    let name: String
//    let symbol: String
//    let rank: Int
//    let isNew: Bool
//    let isActive: Bool
//    let type: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case symbol
//        case rank
//        case isNew = "is_new"
//        case isActive = "is_active"
//        case type
//    }
//
//}
struct Coin: Codable {
    let id: String
    let name: String
    let symbol: String
    let parent: CoinParent?
    let rank: Int
    let isNew: Bool
    let isActive: Bool
    let type: String
    let logo: String?
    let tags: [CoinTag]?
    let team: [CoinTeamMember]?
    let description: String?
    let message: String?
    let openSource: Bool?
    let hardwareWallet: Bool?
    let startedAt: String?
    let developmentStatus: String?
    let proofType: String?
    let orgStructure: String?
    let hashAlgorithm: String?
    let contract: String?
    let platform: String?
    let contracts: [CoinContract]?
    let links: CoinLinks?
    let linksExtended: [CoinLinkExtended]?
    let whitepaper: CoinWhitepaper?
    let firstDataAt: String?
    let lastDataAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, parent, rank
        case isNew = "is_new"
        case isActive = "is_active"
        case type, logo, tags, team, description, message
        case openSource = "open_source"
        case hardwareWallet = "hardware_wallet"
        case startedAt = "started_at"
        case developmentStatus = "development_status"
        case proofType = "proof_type"
        case orgStructure = "org_structure"
        case hashAlgorithm = "hash_algorithm"
        case contract, platform, contracts, links
        case linksExtended = "links_extended"
        case whitepaper
        case firstDataAt = "first_data_at"
        case lastDataAt = "last_data_at"
    }
}

struct CoinParent: Codable {
    let id: String
    let name: String
    let symbol: String
}

struct CoinTag: Codable {
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

struct CoinTeamMember: Codable {
    let id: String
    let name: String
    let position: String
}

struct CoinContract: Codable {
    let contract: String
    let platform: String
    let type: String
}

struct CoinLinks: Codable {
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let sourceCode: [String]?
    let website: [String]?
    let youtube: [String]?
    let medium: String?

    enum CodingKeys: String, CodingKey {
        case explorer, facebook, reddit
        case sourceCode = "source_code"
        case website, youtube, medium
    }
}

struct CoinLinkExtended: Codable {
    let url: String
    let type: String
    let stats: CoinLinkStats?

    struct CoinLinkStats: Codable {
        let subscribers: Int?
        let contributors: Int?
        let stars: Int?
    }
}

struct CoinWhitepaper: Codable {
    let link: String
    let thumbnail: String
}


