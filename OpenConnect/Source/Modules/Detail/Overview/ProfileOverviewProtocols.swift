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
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol ProfileOverviewViewOutput: AnyObject {
    // TO-DO: Declare presenter methods
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
