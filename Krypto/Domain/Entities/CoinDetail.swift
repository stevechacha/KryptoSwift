import Foundation

struct CoinDetail: Hashable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let description: String?
    let startedAt: String?
    let hashAlgorithm: String
    let contract: String?
    let links: CoinLinks?
    let whitepaper: CoinWhitepaper?
}

struct CoinLinks: Hashable {
    let explorer: [String]?
    let website: [String]?
    let twitter: [String]?
}

struct CoinWhitepaper: Hashable {
    let link: String?
    let thumbnail: String?
}
