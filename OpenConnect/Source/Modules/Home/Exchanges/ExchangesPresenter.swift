//
//  ExchangesPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class ExchangesPresenter: ExchangesViewOutput, ExchangesModuleInput, ExchangesInteractorOutput {

    // MARK: Properties
    
    weak var view: ExchangesViewInput?
    var router: ExchangesRouterInput!
    var interactor: ExchangesInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: ExchangesViewOutput methods
    func exchangeSelected(at: Exchange) {
        self.router.showExchangeDetail(exchange: at)
    }
    
    // MARK: ExchangesInteractorOutput methods
}
