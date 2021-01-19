//
//  AddExchangeProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol AddExchangeViewInput: AnyObject {
    func setNavigationTitle(exchange: Exchange)
}

// MARK: Presenter
protocol AddExchangeViewOutput: AnyObject {
    func viewDidLoad()
}

protocol AddExchangeModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: AddExchangeViewInput? { get set }
    var interactor: AddExchangeInteractorInput! { get set }
    var router: AddExchangeRouterInput! { get set }
}

protocol AddExchangeInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol AddExchangeInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol AddExchangeRouterInput: AnyObject {
    // TO-DO: Declare router methods
}
