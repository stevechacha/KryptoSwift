//
//  Tag.swift
//  Krypto
//
//  Created by stephen chacha on 13/10/2024.
//



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
