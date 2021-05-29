//
//  ProfileOverviewProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol ProfileOverviewViewInput: AnyObject {
    func displayData(viewModel: ProfileOverviewViewModel)
}

// MARK: Presenter
protocol ProfileOverviewViewOutput: AnyObject {
    func viewDidLoad()
}

protocol ProfileOverviewModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: ProfileOverviewViewInput? { get set }
    var interactor: ProfileOverviewInteractorInput! { get set }
    var router: ProfileOverviewRouterInput! { get set }
}

protocol ProfileOverviewInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol ProfileOverviewInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol ProfileOverviewRouterInput: AnyObject {
    // TO-DO: Declare router methods
}

class ProfileOverviewViewModel {

    private(set) var assets: [Exchange] = []
    private(set) var sectionTitle: String = ""

    func update(assets: [Exchange], sectionTitle: String) {
        self.assets.removeAll()
        self.assets.append(contentsOf: assets)
        self.sectionTitle = sectionTitle
    }
}
