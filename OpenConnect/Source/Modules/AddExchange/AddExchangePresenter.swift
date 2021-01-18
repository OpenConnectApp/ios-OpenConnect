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
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: AddExchangeViewOutput methods
    
    // MARK: AddExchangeInteractorOutput methods
}
