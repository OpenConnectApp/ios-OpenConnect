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

    private weak var delegate: SelectExchangeDelegate?
    private var viewModel: SelectExchangeViewModel
    
    // MARK: Initialization
    
    init(exchanges: [Exchange], selectedIndex: Int, delegate: SelectExchangeDelegate) {
        self.delegate = delegate
        viewModel = SelectExchangeViewModel(exchanges: exchanges, selectedIndex: selectedIndex)
    }
    
    // MARK: SelectExchangeViewOutput methods
    func viewDidLoad() {
        self.view?.showExchanges(viewModel: self.viewModel)
    }
    
    func addNewExchange() {
        self.view?.dismissScreen { [delegate = self.delegate] in
            delegate?.addNewExchange()
        }
    }

    func exchangeSelected(at: IndexPath) {
        if at.row == self.viewModel.selectedIndex {
            return
        }
        let exchange = viewModel.exchanges[at.row]
        self.view?.dismissScreen { [delegate = self.delegate] in
            delegate?.exchangeSelected(exchange: exchange, selectedIndex: at.row)
        }
    }
    
    // MARK: SelectExchangeInteractorOutput methods
}

class SelectExchangeViewModel {

    private(set) var exchanges: [Exchange] = []
    private(set) var selectedIndex: Int = -1

    init(exchanges: [Exchange], selectedIndex: Int) {
        self.exchanges.append(contentsOf: exchanges)
        self.selectedIndex = selectedIndex
    }

    func update(exchanges: [Exchange]) {
        self.exchanges.removeAll()
        self.exchanges.append(contentsOf: exchanges)
    }

}
