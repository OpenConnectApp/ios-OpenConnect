//
//  AssetsPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class AssetsPresenter: AssetsViewOutput, AssetsModuleInput, AssetsInteractorOutput {

    // MARK: Properties
    
    weak var view: AssetsViewInput?
    var router: AssetsRouterInput!
    var interactor: AssetsInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: AssetsViewOutput methods
    func assetSelected(at: Exchange) {
        self.router.showAssetDetail(exchange: at)
    }
    
    // MARK: AssetsInteractorOutput methods
}
