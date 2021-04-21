//
//  StartupService.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation
import UIKit

public protocol StartupService {
    func setup()
    func initAnalytics(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    func getExchanges()
    func getCurrencies()
}

public final class AppStartupService: StartupService {

    private let grpcService: GRPCManager
    private let appDataService: AppDataService

    init(grpcService: GRPCManager, appDataService: AppDataService) {
        self.grpcService = grpcService
        self.appDataService = appDataService
    }

    public func setup() {
        getExchanges()
        getCurrencies()
    }

    public func initAnalytics(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {

    }

    public func getExchanges() {
        grpcService.execute(type: .exchanges, objectType: PublicDataService_ListExchangesResponse.self) { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let response):
                let exchanges = response.data.map { (exchangeData) -> Exchange in
                    return Exchange(data: exchangeData)
                }
                self.appDataService.saveExchanges(exchanges)
                print("Exchanges count: \(response.data.count)")
            case .failure(let error):
                print("Get Exchanges Error: \(error)")
            }
        }
    }

    public func getCurrencies() {
        grpcService.execute(type: .currencies, objectType: PublicDataService_ListCurrenciesResponse.self) { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let response):
                let currencies = response.data.map { (currencyData) -> Currency in
                    return Currency(data: currencyData)
                }
                self.appDataService.saveCurrencies(currencies)
                print("Currencies count: \(response.data.count)")
            case .failure(let error):
                print("Get Currencies Error: \(error)")
            }
        }
    }
}
