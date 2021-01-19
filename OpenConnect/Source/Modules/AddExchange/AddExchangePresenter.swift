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
    
    // MARK: AddExchangeInteractorOutput methods
}
