//
//  ProfileRootPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class ProfileRootPresenter: ProfileRootViewOutput, ProfileRootModuleInput, ProfileRootInteractorOutput {

    // MARK: Properties
    
    weak var view: ProfileRootViewInput?
    var router: ProfileRootRouterInput!
    var interactor: ProfileRootInteractorInput!

    private var displayType: ProfileDisplayType
    
    // MARK: Initialization
    
    init(displayType: ProfileDisplayType) {
        self.displayType = displayType
    }
    
    // MARK: ProfileRootViewOutput methods
    func viewDidLoad() {
        switch self.displayType {
        case .exchange(let exchange), .asset(let exchange):
            self.view?.setNavigationTitle(exchange: exchange)
        }
        self.view?.displayTabs(viewControllers: [
            ProfileOverviewModuleBuilder.buildModule(dependency: (), payload: self.displayType),
            ProfileTransactionsModuleBuilder.buildModule(dependency: DependencyContainer.shared, payload: ())
        ], titles: ["Overview", "Transactions"])
    }
    
    // MARK: ProfileRootInteractorOutput methods
}
