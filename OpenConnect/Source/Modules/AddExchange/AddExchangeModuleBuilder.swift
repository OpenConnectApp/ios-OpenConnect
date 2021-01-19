//
//  AddExchangeModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct AddExchangeModuleBuilder: ModuleBuilder {
    
    // MARK: AddExchangeBuilder method
    static func buildModule(dependency: (), payload: Exchange) -> AddExchangeViewController {
        let viewController = AddExchangeViewController()
        let router = AddExchangeRouter(viewController: viewController)
        let interactor = AddExchangeInteractor()
        let presenter = AddExchangePresenter(exchange: payload)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
