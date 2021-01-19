//
//  SelectCurrencyRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class SelectCurrencyRouter: SelectCurrencyRouterInput {

    // MARK: Properties
    private weak var viewController: SelectCurrencyViewController?
    
    // MARK: Initialiser
    init(viewController: SelectCurrencyViewController) {
        self.viewController = viewController
    }
    
    // MARK: SelectCurrencyRouterInput methods
}
