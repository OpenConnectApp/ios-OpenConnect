//
//  HomePresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class HomePresenter: HomeViewOutput, HomeModuleInput, HomeInteractorOutput {

    // MARK: Properties
    
    weak var view: HomeViewInput?
    var router: HomeRouterInput!
    var interactor: HomeInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: HomeViewOutput methods
    
    // MARK: HomeInteractorOutput methods
}
