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

    private var displayType: ProfileDisplayType
    private var viewModel: ProfileOverviewViewModel
    
    // MARK: Initialization
    
    init(displayType: ProfileDisplayType) {
        self.displayType = displayType
        viewModel = ProfileOverviewViewModel()
    }
    
    // MARK: ProfileOverviewViewOutput methods
    func viewDidLoad() {
        switch self.displayType {
        case .exchange:
            viewModel.update(assets: DataRepo.coins, sectionTitle: "Assets Overview")
        case .asset:
            viewModel.update(assets: DataRepo.exchanges, sectionTitle: "Exchanges Overview")
        }
        self.view?.displayData(viewModel: self.viewModel)
    }
    
    // MARK: ProfileOverviewInteractorOutput methods
}
