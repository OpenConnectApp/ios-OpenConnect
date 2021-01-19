//
//  SearchExchangeProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol SearchExchangeViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol SearchExchangeViewOutput: AnyObject {
    func addNewExchange(at: Exchange)
}

protocol SearchExchangeModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: SearchExchangeViewInput? { get set }
    var interactor: SearchExchangeInteractorInput! { get set }
    var router: SearchExchangeRouterInput! { get set }
}

protocol SearchExchangeInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol SearchExchangeInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol SearchExchangeRouterInput: AnyObject {
    func showAddNewExchange(exchange: Exchange)
}
