//
//  RootModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct RootModuleBuilder: ModuleBuilder {
    
    // MARK: RootBuilder method
    static func buildModule(dependency: (), payload: ()) -> RootViewController {
        let viewController = RootViewController()
        let router = RootRouter(viewController: viewController)
        let interactor = RootInteractor()
        let presenter = RootPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
