//
//  SearchExchangePresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class SearchExchangePresenter: SearchExchangeViewOutput, SearchExchangeModuleInput, SearchExchangeInteractorOutput {

    // MARK: Properties
    
    weak var view: SearchExchangeViewInput?
    var router: SearchExchangeRouterInput!
    var interactor: SearchExchangeInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: SearchExchangeViewOutput methods
    func addNewExchange(at: IndexPath) {
        self.router.showAddNewExchange()
    }
    
    // MARK: SearchExchangeInteractorOutput methods
}
