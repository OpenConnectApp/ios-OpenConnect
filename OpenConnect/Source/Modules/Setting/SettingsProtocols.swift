//
//  SettingsProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 16/05/21.
//  
//

import Foundation
import UIKit

// MARK: View
protocol SettingsViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol SettingsViewOutput: AnyObject {
    // TO-DO: Declare presenter methods
}

protocol SettingsModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: SettingsViewInput? { get set }
    var interactor: SettingsInteractorInput! { get set }
    var router: SettingsRouterInput! { get set }
}

protocol SettingsInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol SettingsInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol SettingsRouterInput: AnyObject {
    // TO-DO: Declare router methods
}
