//
//  RootProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol RootViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol RootViewOutput: AnyObject {
    func switchExchangeSelected()
}

protocol RootModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: RootViewInput? { get set }
    var interactor: RootInteractorInput! { get set }
    var router: RootRouterInput! { get set }
}

protocol RootInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol RootInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol RootRouterInput: AnyObject {
    func showSwitchExchange(delegate: SelectExchangeDelegate)
    func showAddNewExchange()
    func showExchangeOverview(exchange: Exchange, selectedIndex: Int)
}
