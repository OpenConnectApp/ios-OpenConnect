//
//  SelectExchangePresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class SelectExchangePresenter: SelectExchangeViewOutput, SelectExchangeModuleInput, SelectExchangeInteractorOutput {

    // MARK: Properties
    
    weak var view: SelectExchangeViewInput?
    var router: SelectExchangeRouterInput!
    var interactor: SelectExchangeInteractorInput!

    private var addExchangeCompletion: () -> Void
    
    // MARK: Initialization
    
    init(addExchangeCompletion: @escaping () -> Void) {
        self.addExchangeCompletion = addExchangeCompletion
    }
    
    // MARK: SelectExchangeViewOutput methods
    func addNewExchange() {
        self.view?.dismissScreen { [addExchangeCompletion = self.addExchangeCompletion] in
            addExchangeCompletion()
        }
    }

    func exchangeSelected(at: IndexPath) {
        self.view?.dismissScreen {
        }
    }
    
    // MARK: SelectExchangeInteractorOutput methods
}
