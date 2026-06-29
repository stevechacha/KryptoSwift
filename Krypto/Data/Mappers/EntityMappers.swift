import Foundation

extension CoinDTO {
    func toDomain() -> Coin {
        Coin(
            id: id,
            name: name,
            symbol: symbol,
            rank: rank,
            isNew: isNew,
            isActive: isActive,
            type: type
        )
    }
}

extension CoinDetailDTO {
    func toDomain() -> CoinDetail {
        CoinDetail(
            id: id,
            name: name,
            symbol: symbol,
            rank: rank,
            description: description,
            startedAt: startedAt,
            hashAlgorithm: hashAlgorithm,
            contract: contract,
            links: links?.toDomain(),
            whitepaper: whitepaper?.toDomain()
        )
    }
}

extension CoinLinksDTO {
    func toDomain() -> CoinLinks {
        CoinLinks(explorer: explorer, website: website, twitter: twitter)
    }
}

extension CoinWhitepaperDTO {
    func toDomain() -> CoinWhitepaper {
        CoinWhitepaper(link: link, thumbnail: thumbnail)
    }
}

extension ExchangeDTO {
    func toDomain() -> Exchange {
        Exchange(
            id: id,
            name: name,
            active: active,
            websiteStatus: websiteStatus,
            apiStatus: apiStatus,
            description: description,
            message: message,
            links: links?.toDomain(),
            marketsDataFetched: marketsDataFetched,
            adjustedRank: adjustedRank,
            reportedRank: reportedRank,
            currencies: currencies,
            markets: markets,
            fiats: fiats.map { $0.toDomain() },
            quotes: quotes?.mapValues { $0.toDomain() },
            lastUpdated: lastUpdated
        )
    }
}

extension ExchangeDetailDTO {
    func toDomain() -> ExchangeDetail {
        ExchangeDetail(
            id: id,
            name: name,
            active: active,
            websiteStatus: websiteStatus,
            apiStatus: apiStatus,
            description: description,
            message: message,
            links: links?.toDomain(),
            marketsDataFetched: marketsDataFetched,
            adjustedRank: adjustedRank,
            reportedRank: reportedRank,
            currencies: currencies,
            markets: markets,
            fiats: fiats.map { $0.toDomain() },
            quotes: quotes.mapValues { $0.toDomain() },
            lastUpdated: lastUpdated
        )
    }
}

extension FiatDTO {
    func toDomain() -> Fiat {
        Fiat(name: name, symbol: symbol)
    }
}

extension ExchangeLinksDTO {
    func toDomain() -> ExchangeLinks {
        ExchangeLinks(
            twitter: twitter,
            explorer: explorer,
            facebook: facebook,
            reddit: reddit,
            sourceCode: sourceCode,
            website: website,
            youtube: youtube,
            medium: medium
        )
    }
}

extension ExchangeQuoteDTO {
    func toDomain() -> ExchangeQuote {
        ExchangeQuote(
            reportedVolume24H: reportedVolume24H,
            adjustedVolume24H: adjustedVolume24H,
            reportedVolume7D: reportedVolume7D,
            adjustedVolume7D: adjustedVolume7D,
            reportedVolume30D: reportedVolume30D,
            adjustedVolume30D: adjustedVolume30D
        )
    }
}

extension MarketDTO {
    func toDomain() -> Market {
        Market(
            pair: pair,
            baseCurrencyID: baseCurrencyID,
            baseCurrencyName: baseCurrencyName,
            quoteCurrencyID: quoteCurrencyID,
            quoteCurrencyName: quoteCurrencyName,
            marketURL: marketURL,
            category: category,
            feeType: feeType,
            outlier: outlier,
            reportedVolume24hShare: reportedVolume24hShare,
            quotes: quotes.mapValues { $0.toDomain() },
            lastUpdated: lastUpdated
        )
    }
}

extension MarketQuoteDTO {
    func toDomain() -> MarketQuote {
        MarketQuote(price: price, volume24h: volume24h)
    }
}

extension PriceConversionDTO {
    func toDomain() -> PriceConversion {
        PriceConversion(
            baseCurrencyID: baseCurrencyID,
            baseCurrencyName: baseCurrencyName,
            basePriceLastUpdated: basePriceLastUpdated,
            quoteCurrencyID: quoteCurrencyID,
            quoteCurrencyName: quoteCurrencyName,
            quotePriceLastUpdated: quotePriceLastUpdated,
            amount: amount,
            price: price
        )
    }
}
