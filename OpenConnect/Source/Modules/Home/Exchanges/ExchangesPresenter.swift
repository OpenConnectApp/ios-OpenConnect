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

    private var viewModel: ExchangesViewModel
    
    // MARK: Initialization
    
    init() {
        viewModel = ExchangesViewModel()
    }
    
    // MARK: ExchangesViewOutput methods
    func viewDidLoad() {
        viewModel.update(exchanges: DataRepo.exchanges)
        self.view?.showExchanges(viewModel: self.viewModel)
    }

    func viewWillAppear() {
        AppDataServiceImpl.currentSelectedExchange = -1
    }

    func exchangeSelected(at: IndexPath) {
        AppDataServiceImpl.currentSelectedExchange = at.row
        self.router.showExchangeDetail(exchange: viewModel.exchanges[at.row])
    }
    
    // MARK: ExchangesInteractorOutput methods
}
