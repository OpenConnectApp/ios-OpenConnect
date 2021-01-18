//
//  RootPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class RootPresenter: RootViewOutput, RootModuleInput, RootInteractorOutput {

    // MARK: Properties
    
    weak var view: RootViewInput?
    var router: RootRouterInput!
    var interactor: RootInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: RootViewOutput methods
    
    // MARK: RootInteractorOutput methods
}
