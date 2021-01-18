//
//  HomeProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol HomeViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol HomeViewOutput: AnyObject {
    // TO-DO: Declare presenter methods
}

protocol HomeModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: HomeViewInput? { get set }
    var interactor: HomeInteractorInput! { get set }
    var router: HomeRouterInput! { get set }
}

protocol HomeInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol HomeInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol HomeRouterInput: AnyObject {
    // TO-DO: Declare router methods
}
