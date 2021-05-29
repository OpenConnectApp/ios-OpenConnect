//
//  ProfileOverviewModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct ProfileOverviewModuleBuilder: ModuleBuilder {
    
    // MARK: ProfileOverviewBuilder method
    static func buildModule(dependency: (), payload: ProfileDisplayType) -> ProfileOverviewViewController {
        let viewController = ProfileOverviewViewController()
        let router = ProfileOverviewRouter(viewController: viewController)
        let interactor = ProfileOverviewInteractor()
        let presenter = ProfileOverviewPresenter(displayType: payload)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
