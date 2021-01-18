//
//  ProfileTransactionsRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ProfileTransactionsRouter: ProfileTransactionsRouterInput {

    // MARK: Properties
    private weak var viewController: ProfileTransactionsViewController?
    
    // MARK: Initialiser
    init(viewController: ProfileTransactionsViewController) {
        self.viewController = viewController
    }
    
    // MARK: ProfileTransactionsRouterInput methods
}
