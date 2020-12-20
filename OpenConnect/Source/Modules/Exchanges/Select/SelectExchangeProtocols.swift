//
//  SelectExchangeProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol SelectExchangeViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol SelectExchangeViewOutput: AnyObject {
    // TO-DO: Declare presenter methods
}

protocol SelectExchangeModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: SelectExchangeViewInput? { get set }
    var interactor: SelectExchangeInteractorInput! { get set }
    var router: SelectExchangeRouterInput! { get set }
}

protocol SelectExchangeInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol SelectExchangeInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol SelectExchangeRouterInput: AnyObject {
    // TO-DO: Declare router methods
}