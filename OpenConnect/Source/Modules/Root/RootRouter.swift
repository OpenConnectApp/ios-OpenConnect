//
//  RootRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class RootRouter: RootRouterInput {

    // MARK: Properties
    private weak var viewController: RootViewController?
    
    // MARK: Initialiser
    init(viewController: RootViewController) {
        self.viewController = viewController
    }
    
    // MARK: RootRouterInput methods
}
