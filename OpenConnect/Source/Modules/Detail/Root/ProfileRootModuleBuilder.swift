//
//  ProfileRootModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct ProfileRootModuleBuilder: ModuleBuilder {
    
    // MARK: ProfileRootBuilder method
    static func buildModule(dependency: (), payload: ()) -> ProfileRootViewController {
        let viewController = ProfileRootViewController()
        let router = ProfileRootRouter(viewController: viewController)
        let interactor = ProfileRootInteractor()
        let presenter = ProfileRootPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}