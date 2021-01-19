//
//  ProfileRootProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol ProfileRootViewInput: AnyObject {
    func setNavigationTitle(exchange: Exchange)
}

// MARK: Presenter
protocol ProfileRootViewOutput: AnyObject {
    func viewDidLoad()
}

protocol ProfileRootModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: ProfileRootViewInput? { get set }
    var interactor: ProfileRootInteractorInput! { get set }
    var router: ProfileRootRouterInput! { get set }
}

protocol ProfileRootInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol ProfileRootInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol ProfileRootRouterInput: AnyObject {
    // TO-DO: Declare router methods
}
