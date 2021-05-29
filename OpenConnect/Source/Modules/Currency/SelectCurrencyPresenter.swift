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

    private var dataService: AppDataService
    private var viewModel: SelectCurrencyViewModel
    
    // MARK: Initialization
    
    init(dataService: AppDataService) {
        self.dataService = dataService
        self.viewModel = SelectCurrencyViewModel()
    }
    
    // MARK: SelectCurrencyViewOutput methods
    
    // MARK: SelectCurrencyInteractorOutput methods
    func viewDidLoad() {
        self.viewModel.update(currencies: self.dataService.currencies)
        self.view?.showCurrencies(viewModel: self.viewModel)
    }

    func currencySelected(at: IndexPath) {
    }
}
