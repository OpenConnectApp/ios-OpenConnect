//
//  ExchangesModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct ExchangesModuleBuilder: ModuleBuilder {
    
    // MARK: ExchangesBuilder method
    static func buildModule(dependency: (), payload: ()) -> ExchangesViewController {
        let viewController = ExchangesViewController()
        let router = ExchangesRouter(viewController: viewController)
        let interactor = ExchangesInteractor()
        let presenter = ExchangesPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
