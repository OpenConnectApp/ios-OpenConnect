//
//  AssetsRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class AssetsRouter: AssetsRouterInput {

    // MARK: Properties
    private weak var viewController: AssetsViewController?
    
    // MARK: Initialiser
    init(viewController: AssetsViewController) {
        self.viewController = viewController
    }
    
    // MARK: AssetsRouterInput methods
}
