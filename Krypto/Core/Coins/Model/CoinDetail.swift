struct CoinDetail: Codable {
    let id: String
    let name: String
    let symbol: String
    let description: String?
    let logo: String?
    let rank: Int
    let isActive: Bool
    let tags: [CoinTag]?
    let team: [CoinTeamMember]?
    let contracts: [CoinContract]?
    let links: CoinLinks?
    let whitepaper: CoinWhitepaper?

    // Add more fields based on the detailed coin response
}
