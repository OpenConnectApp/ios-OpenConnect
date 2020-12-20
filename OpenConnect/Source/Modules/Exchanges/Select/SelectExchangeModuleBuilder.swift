//
//  SelectExchangeModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct SelectExchangeModuleBuilder: ModuleBuilder {
    
    // MARK: SelectExchangeBuilder method
    static func buildModule(dependency: (), payload: ()) -> SelectExchangeViewController {
        let viewController = SelectExchangeViewController()
        let router = SelectExchangeRouter(viewController: viewController)
        let interactor = SelectExchangeInteractor()
        let presenter = SelectExchangePresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
