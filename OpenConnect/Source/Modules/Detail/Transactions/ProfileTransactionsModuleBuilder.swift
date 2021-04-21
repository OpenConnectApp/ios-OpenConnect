//
//  ProfileTransactionsModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct ProfileTransactionsModuleBuilder: ModuleBuilder {
    
    // MARK: ProfileTransactionsBuilder method
    static func buildModule(dependency: Dependency, payload: ()) -> ProfileTransactionsViewController {
        let viewController = ProfileTransactionsViewController()
        let router = ProfileTransactionsRouter(viewController: viewController)
        let interactor = ProfileTransactionsInteractor(grpcService: dependency.grpcService)
        let presenter = ProfileTransactionsPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
