//
//  ExchangesRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ExchangesRouter: ExchangesRouterInput {

    // MARK: Properties
    private weak var viewController: ExchangesViewController?
    
    // MARK: Initialiser
    init(viewController: ExchangesViewController) {
        self.viewController = viewController
    }
    
    // MARK: ExchangesRouterInput methods
    func showExchangeDetail() {
        let vc = ProfileRootModuleBuilder.buildModule(dependency: (), payload: ())
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
