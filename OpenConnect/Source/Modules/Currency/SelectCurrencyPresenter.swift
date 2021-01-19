//
//  SelectCurrencyPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class SelectCurrencyPresenter: SelectCurrencyViewOutput, SelectCurrencyModuleInput, SelectCurrencyInteractorOutput {

    // MARK: Properties
    
    weak var view: SelectCurrencyViewInput?
    var router: SelectCurrencyRouterInput!
    var interactor: SelectCurrencyInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: SelectCurrencyViewOutput methods
    
    // MARK: SelectCurrencyInteractorOutput methods
}
