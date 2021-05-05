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

    private var dataService: AppDataService
    private var viewModel: SearchExchangeViewModel
    
    // MARK: Initialization
    
    init(dataService: AppDataService) {
        self.dataService = dataService
        self.viewModel = SearchExchangeViewModel()
    }
    
    // MARK: SearchExchangeViewOutput methods
    func viewDidLoad() {
        self.viewModel.update(exchanges: self.dataService.exchanges)
        self.view?.showExchanges(viewModel: self.viewModel)
    }

    func exchangeSelected(at: IndexPath) {
        self.router.showAddNewExchange(exchange: viewModel.exchanges[at.row])
    }
    
    // MARK: SearchExchangeInteractorOutput methods
}
