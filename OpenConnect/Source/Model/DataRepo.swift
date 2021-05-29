//
//  DataRepo.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 15/05/21.
//

import Foundation

class DataRepo {

    private init() {}

    public static var newExchanges: [Exchange] = {
        return [
            Exchange(title: "Binance", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/270.png"),
            Exchange(title: "Coinbase", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/89.png"),
            Exchange(title: "Kraken", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/24.png"),
            Exchange(title: "CoinDCX", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/949.png"),
            Exchange(title: "Delta Exchange", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/705.png")
        ]
    }()

    public static var exchanges: [Exchange] = {
        return [
            Exchange(title: "Binance Main Profile", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/270.png"),
            Exchange(title: "Coinbase Pro Profile", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/89.png"),
            Exchange(title: "Kraken Profile 1", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/24.png"),
            Exchange(title: "CoinDCX Sub Profile 2", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/949.png"),
            Exchange(title: "Delta.Exchange BTC Profile", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/705.png")
        ]
    }()

    public static var coins: [Exchange] = {
        return  [
            Exchange(title: "Bitcoin", iconUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"),
            Exchange(title: "Litecoin", iconUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/2.png"),
            Exchange(title: "Deribit", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/522.png"),
            Exchange(title: "Kraken", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/24.png"),
            Exchange(title: "Bitfinex", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/37.png"),
            Exchange(title: "CEX.io", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/36.png"),
            Exchange(title: "Coinbase", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/89.png"),
            Exchange(title: "Kucoin", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/311.png"),
            Exchange(title: "BitMex", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/157.png"),
            Exchange(title: "BitBNS", iconUrl: "https://s2.coinmarketcap.com/static/img/exchanges/64x64/376.png"),
            Exchange(title: "DogeCoin", iconUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/74.png"),
            Exchange(title: "Ethereum", iconUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"),
            Exchange(title: "Tether", iconUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/825.png")
        ]
    }()
}
