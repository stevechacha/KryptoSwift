import Foundation

struct PriceConversion: Hashable {
    let baseCurrencyID: String
    let baseCurrencyName: String
    let basePriceLastUpdated: String
    let quoteCurrencyID: String
    let quoteCurrencyName: String
    let quotePriceLastUpdated: String
    let amount: Double
    let price: Double
}
