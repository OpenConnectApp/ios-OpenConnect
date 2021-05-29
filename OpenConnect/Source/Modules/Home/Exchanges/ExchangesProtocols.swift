//
//  ExchangesProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol ExchangesViewInput: AnyObject {
    func showExchanges(viewModel: ExchangesViewModel)
}

// MARK: Presenter
protocol ExchangesViewOutput: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func exchangeSelected(at: IndexPath)
}

protocol ExchangesModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: ExchangesViewInput? { get set }
    var interactor: ExchangesInteractorInput! { get set }
    var router: ExchangesRouterInput! { get set }
}

protocol ExchangesInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol ExchangesInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol ExchangesRouterInput: AnyObject {
    func showExchangeDetail(exchange: Exchange)
}

class ExchangesViewModel {

    private(set) var exchanges: [Exchange] = []
    
    func update(exchanges: [Exchange]) {
        self.exchanges.removeAll()
        self.exchanges.append(contentsOf: exchanges)
    }
}
