//
//  AssetsModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct AssetsModuleBuilder: ModuleBuilder {
    
    // MARK: AssetsBuilder method
    static func buildModule(dependency: (), payload: ()) -> AssetsViewController {
        let viewController = AssetsViewController()
        let router = AssetsRouter(viewController: viewController)
        let interactor = AssetsInteractor()
        let presenter = AssetsPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
