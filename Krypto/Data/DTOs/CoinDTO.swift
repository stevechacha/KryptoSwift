import Foundation

struct CoinDTO: Codable {
    let id: String
    let name: String
    let symbol: String
    let rank: Int
    let isNew: Bool
    let isActive: Bool
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank, type
        case isNew = "is_new"
        case isActive = "is_active"
    }
}
