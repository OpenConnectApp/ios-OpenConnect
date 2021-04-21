//
//  AppDataService.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation

protocol AppDataService: AnyObject {
    var exchanges: [Exchange] { get }
    var currencies: [Currency] { get }

    func saveExchanges(_ exchanges: [Exchange])
    func saveCurrencies(_ currencies: [Currency])
}

final class AppDataServiceImpl: AppDataService {

    private(set) var exchanges: [Exchange] = []

    private(set) var currencies: [Currency] = []

    func saveExchanges(_ exchanges: [Exchange]) {
        self.exchanges = exchanges
        // TODO: Cache to local disk
    }

    func saveCurrencies(_ currencies: [Currency]) {
        self.currencies = currencies
        // TODO: Cache to local disk
    }
}
