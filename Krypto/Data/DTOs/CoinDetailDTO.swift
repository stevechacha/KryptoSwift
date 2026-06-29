import Foundation

struct CoinDetailDTO: Codable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let description: String?
    let startedAt: String?
    let hashAlgorithm: String
    let contract: String?
    let links: CoinLinksDTO?
    let whitepaper: CoinWhitepaperDTO?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank, description
        case startedAt = "started_at"
        case hashAlgorithm = "hash_algorithm"
        case contract
        case links, whitepaper
    }
}

struct CoinLinksDTO: Codable {
    let explorer: [String]?
    let website: [String]?
    let twitter: [String]?
}

struct CoinWhitepaperDTO: Codable {
    let link: String?
    let thumbnail: String?
}
