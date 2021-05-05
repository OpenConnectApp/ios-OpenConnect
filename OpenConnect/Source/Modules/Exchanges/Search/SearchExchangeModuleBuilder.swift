//
//  SearchExchangeModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct SearchExchangeModuleBuilder: ModuleBuilder {
    
    // MARK: SearchExchangeBuilder method
    static func buildModule(dependency: Dependency, payload: ()) -> SearchExchangeViewController {
        let viewController = SearchExchangeViewController()
        let router = SearchExchangeRouter(viewController: viewController, dependency: dependency)
        let interactor = SearchExchangeInteractor()
        let presenter = SearchExchangePresenter(dataService: dependency.appDataService)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
