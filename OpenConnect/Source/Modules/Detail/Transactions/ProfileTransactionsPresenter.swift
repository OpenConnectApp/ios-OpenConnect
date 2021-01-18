//
//  ProfileTransactionsPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class ProfileTransactionsPresenter: ProfileTransactionsViewOutput, ProfileTransactionsModuleInput, ProfileTransactionsInteractorOutput {

    // MARK: Properties
    
    weak var view: ProfileTransactionsViewInput?
    var router: ProfileTransactionsRouterInput!
    var interactor: ProfileTransactionsInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: ProfileTransactionsViewOutput methods
    
    // MARK: ProfileTransactionsInteractorOutput methods
}
