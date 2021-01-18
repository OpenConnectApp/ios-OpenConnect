//
//  HomeRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class HomeRouter: HomeRouterInput {

    // MARK: Properties
    private weak var viewController: HomeViewController?
    
    // MARK: Initialiser
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
    // MARK: HomeRouterInput methods
}
