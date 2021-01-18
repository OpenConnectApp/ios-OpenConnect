//
//  ProfileTransactionsProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol ProfileTransactionsViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol ProfileTransactionsViewOutput: AnyObject {
    // TO-DO: Declare presenter methods
}

protocol ProfileTransactionsModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: ProfileTransactionsViewInput? { get set }
    var interactor: ProfileTransactionsInteractorInput! { get set }
    var router: ProfileTransactionsRouterInput! { get set }
}

protocol ProfileTransactionsInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol ProfileTransactionsInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol ProfileTransactionsRouterInput: AnyObject {
    // TO-DO: Declare router methods
}
