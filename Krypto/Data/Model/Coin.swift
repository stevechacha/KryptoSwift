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






