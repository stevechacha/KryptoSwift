//
//  Links.swift
//  Krypto
//
//  Created by stephen chacha on 13/10/2024.
//



struct Links: Codable ,Hashable{
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let sourceCode: [String]?
    let website: [String]?
    let twitter: [String]?
    let youtube: [String]?
    let medium: String?

    enum CodingKeys: String, CodingKey {
        case explorer, facebook, reddit
        case sourceCode = "source_code"
        case website, youtube, medium
        case twitter
    }
}