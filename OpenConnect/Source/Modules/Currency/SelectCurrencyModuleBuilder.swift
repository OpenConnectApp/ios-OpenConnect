//
//  SelectCurrencyModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct SelectCurrencyModuleBuilder: ModuleBuilder {
    
    // MARK: SelectCurrencyBuilder method
    static func buildModule(dependency: (), payload: ()) -> SelectCurrencyViewController {
        let viewController = SelectCurrencyViewController()
        let router = SelectCurrencyRouter(viewController: viewController)
        let interactor = SelectCurrencyInteractor()
        let presenter = SelectCurrencyPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
