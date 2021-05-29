//
//  SelectCurrencyProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol SelectCurrencyViewInput: AnyObject {
    func showCurrencies(viewModel: SelectCurrencyViewModel)
}

// MARK: Presenter
protocol SelectCurrencyViewOutput: AnyObject {
    func viewDidLoad()
    func currencySelected(at: IndexPath)
}

protocol SelectCurrencyModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: SelectCurrencyViewInput? { get set }
    var interactor: SelectCurrencyInteractorInput! { get set }
    var router: SelectCurrencyRouterInput! { get set }
}

protocol SelectCurrencyInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol SelectCurrencyInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol SelectCurrencyRouterInput: AnyObject {
    // TO-DO: Declare router methods
}

struct SelectCurrencyViewModel {

    private(set) var currencies: [Currency] = []

    mutating func update(currencies: [Currency]) {
        self.currencies.removeAll()
        self.currencies.append(contentsOf: currencies)
    }
}
