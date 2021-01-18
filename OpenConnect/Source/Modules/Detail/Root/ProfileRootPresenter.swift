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
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: ProfileRootViewOutput methods
    
    // MARK: ProfileRootInteractorOutput methods
}
