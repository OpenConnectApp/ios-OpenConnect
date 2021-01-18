//
//  ProfileOverviewPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class ProfileOverviewPresenter: ProfileOverviewViewOutput, ProfileOverviewModuleInput, ProfileOverviewInteractorOutput {

    // MARK: Properties
    
    weak var view: ProfileOverviewViewInput?
    var router: ProfileOverviewRouterInput!
    var interactor: ProfileOverviewInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: ProfileOverviewViewOutput methods
    
    // MARK: ProfileOverviewInteractorOutput methods
}
