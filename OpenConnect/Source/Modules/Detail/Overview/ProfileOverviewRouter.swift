//
//  ProfileOverviewRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ProfileOverviewRouter: ProfileOverviewRouterInput {

    // MARK: Properties
    private weak var viewController: ProfileOverviewViewController?
    
    // MARK: Initialiser
    init(viewController: ProfileOverviewViewController) {
        self.viewController = viewController
    }
    
    // MARK: ProfileOverviewRouterInput methods
}
