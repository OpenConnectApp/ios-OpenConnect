//
//  ProfileRootRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ProfileRootRouter: ProfileRootRouterInput {

    // MARK: Properties
    private weak var viewController: ProfileRootViewController?
    
    // MARK: Initialiser
    init(viewController: ProfileRootViewController) {
        self.viewController = viewController
    }
    
    // MARK: ProfileRootRouterInput methods
}
