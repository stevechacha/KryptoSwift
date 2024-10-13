//
//  LinksExtended.swift
//  Krypto
//
//  Created by stephen chacha on 13/10/2024.
//



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
