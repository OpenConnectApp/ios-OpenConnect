//
//  SearchExchangeRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class SearchExchangeRouter: SearchExchangeRouterInput {

    // MARK: Properties
    private weak var viewController: SearchExchangeViewController?
    private var dependency: Dependency
    
    // MARK: Initialiser
    init(viewController: SearchExchangeViewController, dependency: Dependency) {
        self.viewController = viewController
        self.dependency = dependency
    }
    
    // MARK: SearchExchangeRouterInput methods
    func showAddNewExchange(exchange: Exchange) {
        let vc = AddExchangeModuleBuilder.buildModule(dependency: dependency, payload: exchange)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
