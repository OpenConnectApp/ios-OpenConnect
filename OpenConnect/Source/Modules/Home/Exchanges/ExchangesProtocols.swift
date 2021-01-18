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
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol ExchangesViewOutput: AnyObject {
    // TO-DO: Declare presenter methods
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
    // TO-DO: Declare router methods
}

// MARK: ExchangesModuleBuilder
protocol ExchangesBuilder {
    static func buildModule() -> ExchangesViewController
}