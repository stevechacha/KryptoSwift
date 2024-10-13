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
    let tags: [TagDto]?
    let team: [TeamMemberDto]?
    let description: String?
    let message: String?
    let openSource: Bool?
    let startedAt: String?
    let developmentStatus: String?
    let hardwareWallet: Bool?
    let proofType: String?
    let orgStructure: String?
    let hashAlgorithm: String?
    let links: CoinDetailLinkDto?
    let linksExtended: [LinksExtendedDto]?
    let whitepaper: WhitePaperDto?
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


struct TagDto: Codable, Hashable {
    let id: String?
    let name: String?
}

struct TeamMemberDto: Codable, Hashable {
    let id: String?
    let name: String?
    let position: String?
}

struct CoinDetailLinkDto: Codable, Hashable {
    let website: [String]?
    let explorer: [String]?
    let twitter: [String]?
}

struct LinksExtendedDto: Codable, Hashable {
    let url: String?
    let type: String?
}

struct WhitePaperDto: Codable, Hashable {
    let link: String?
    let thumbnail: String?
}
