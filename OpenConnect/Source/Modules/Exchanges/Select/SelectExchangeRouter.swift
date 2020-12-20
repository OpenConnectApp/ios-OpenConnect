//
//  SelectExchangeRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class SelectExchangeRouter: SelectExchangeRouterInput {

    // MARK: Properties
    private weak var viewController: SelectExchangeViewController?
    
    // MARK: Initialiser
    init(viewController: SelectExchangeViewController) {
        self.viewController = viewController
    }
    
    // MARK: SelectExchangeRouterInput methods
}
