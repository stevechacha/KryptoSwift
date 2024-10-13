//
//  CoinDetail.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//


import Foundation

struct CoinDetail: Codable, Identifiable, Hashable {
    let id: String?
    let name: String?
    let symbol: String?
    let rank: Int?
    let isNew: Bool?
    let isActive: Bool?
    let type: String?
    let tags: [Tag]?
    let team: [TeamMember]?
    let description: String?
    let message: String?
    let openSource: Bool?
    let startedAt: String?
    let developmentStatus: String?
    let hardwareWallet: Bool?
    let proofType: String?
    let orgStructure: String?
    let hashAlgorithm: String?
    let links: Links?
    let linksExtended: [LinksExtended]?
    let whitepaper: WhitePaper?
    let firstDataAt: String?
    let lastDataAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank, description, message, type, team, links
        case isNew = "is_new"
        case isActive = "is_active"
        case tags = "tagDtos"
        case openSource = "open_source"
        case startedAt = "started_at"
        case developmentStatus = "development_status"
        case hardwareWallet = "hardware_wallet"
        case proofType = "proof_type"
        case orgStructure = "org_structure"
        case hashAlgorithm = "hash_algorithm"
        case linksExtended = "links_extended"
        case whitepaper = "whitepaperDto"
        case firstDataAt = "first_data_at"
        case lastDataAt = "last_data_at"
    }
}


struct TeamMember: Codable, Hashable {
    let id: String?
    let name: String?
    let position: String?
}



struct WhitePaper: Codable, Hashable {
    let link: String?
    let thumbnail: String?
}

