//
//  AddExchangePresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class AddExchangePresenter: AddExchangeViewOutput, AddExchangeModuleInput, AddExchangeInteractorOutput {

    // MARK: Properties
    
    weak var view: AddExchangeViewInput?
    var router: AddExchangeRouterInput!
    var interactor: AddExchangeInteractorInput!

    private var selectedExchange: Exchange
    
    // MARK: Initialization
    
    init(exchange: Exchange) {
        self.selectedExchange = exchange
    }
    
    // MARK: AddExchangeViewOutput methods
    func viewDidLoad() {
        self.view?.setNavigationTitle(exchange: selectedExchange)
    }

    func addExchangePortfolio(exchange: AddExchange) {
        guard !exchange.profileName.isEmpty else {
            self.view?.showSnackbar(with: "Profile Name cannot be empty")
            return
        }
        guard !exchange.profileName.isEmpty else {
            self.view?.showSnackbar(with: "API Key cannot be empty")
            return
        }
        guard !exchange.profileName.isEmpty else {
            self.view?.showSnackbar(with: "API secret cannot be empty")
            return
        }
        addExchange(exchange: exchange)
    }

    private func addExchange(exchange: AddExchange) {
//        self.view?.showSpinner()
//        self.interactor.addExchange(exchange: exchange)
    }
    
    // MARK: AddExchangeInteractorOutput methods
    func addExchangeSuccess() {
        self.view?.hideSpinner()
    }

    func addExchangeError(error: Error) {
        self.view?.hideSpinner()
    }
}
