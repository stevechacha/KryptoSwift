//
//  CurrencyPrice.swift
//  Krypto
//
//  Created by stephen chacha on 21/12/2024.
//


import Foundation

struct CurrencyPrice: Codable {
    let baseCurrencyID: String
    let baseCurrencyName: String
    let basePriceLastUpdated: String
    let quoteCurrencyID: String
    let quoteCurrencyName: String
    let quotePriceLastUpdated: String
    let amount: Double
    let price: Double

    enum CodingKeys: String, CodingKey {
        case baseCurrencyID = "base_currency_id"
        case baseCurrencyName = "base_currency_name"
        case basePriceLastUpdated = "base_price_last_updated"
        case quoteCurrencyID = "quote_currency_id"
        case quoteCurrencyName = "quote_currency_name"
        case quotePriceLastUpdated = "quote_price_last_updated"
        case amount, price
    }
}
