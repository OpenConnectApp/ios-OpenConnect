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
protocol ProfileTransactionsViewInput: BaseViewInput {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol ProfileTransactionsViewOutput: AnyObject {
    func viewDidLoad()
    func retryLoadTransactions()
}

protocol ProfileTransactionsModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: ProfileTransactionsViewInput? { get set }
    var interactor: ProfileTransactionsInteractorInput! { get set }
    var router: ProfileTransactionsRouterInput! { get set }
}

protocol ProfileTransactionsInteractorOutput: AnyObject {
    func loadTransactionsSuccess()
    func loadTransactionsError(_ error: Error)
}

// MARK: Interactor
protocol ProfileTransactionsInteractorInput: AnyObject {
    func loadTransactions()
}

// MARK: Router
protocol ProfileTransactionsRouterInput: AnyObject {
    // TO-DO: Declare router methods
}
