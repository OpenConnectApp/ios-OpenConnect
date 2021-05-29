//
//  SettingsModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 16/05/21.
//  
//

import Foundation
import UIKit

struct SettingsModuleBuilder: ModuleBuilder {
    
    // MARK: SettingsBuilder method
    static func buildModule(dependency: (), payload: ()) -> SettingsViewController {
        let viewController = SettingsViewController()
        let router = SettingsRouter(viewController: viewController)
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        return viewController
    }
}
