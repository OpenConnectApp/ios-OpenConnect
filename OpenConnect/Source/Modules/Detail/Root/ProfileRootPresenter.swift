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

    private var selectedExchange: Exchange
    
    // MARK: Initialization
    
    init(exchange: Exchange) {
        selectedExchange = exchange
    }
    
    // MARK: ProfileRootViewOutput methods
    func viewDidLoad() {
        self.view?.setNavigationTitle(exchange: selectedExchange)
    }
    
    // MARK: ProfileRootInteractorOutput methods
}
