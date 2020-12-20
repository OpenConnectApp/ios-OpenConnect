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
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: SelectExchangeViewOutput methods
    
    // MARK: SelectExchangeInteractorOutput methods
}
