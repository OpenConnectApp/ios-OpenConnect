//
//  HomeModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct HomeModuleBuilder: ModuleBuilder {
    
    // MARK: HomeBuilder method
    static func buildModule(dependency: (), payload: ()) -> HomeViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
