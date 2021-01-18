//
//  AddExchangeRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class AddExchangeRouter: AddExchangeRouterInput {

    // MARK: Properties
    private weak var viewController: AddExchangeViewController?
    
    // MARK: Initialiser
    init(viewController: AddExchangeViewController) {
        self.viewController = viewController
    }
    
    // MARK: AddExchangeRouterInput methods
}
