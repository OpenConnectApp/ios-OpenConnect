//
//  SettingsRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 16/05/21.
//  
//

import Foundation
import UIKit

final class SettingsRouter: SettingsRouterInput {

    // MARK: Properties
    private weak var viewController: SettingsViewController?
    
    // MARK: Initialiser
    init(viewController: SettingsViewController) {
        self.viewController = viewController
    }
    
    // MARK: SettingsRouterInput methods
}
