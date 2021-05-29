//
//  SettingsPresenter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 16/05/21.
//  
//

import Foundation

final class SettingsPresenter: SettingsViewOutput, SettingsModuleInput, SettingsInteractorOutput {

    // MARK: Properties
    
    weak var view: SettingsViewInput?
    var router: SettingsRouterInput!
    var interactor: SettingsInteractorInput!
    
    // MARK: Initialization
    
    init() {
    }
    
    // MARK: SettingsViewOutput methods
    
    // MARK: SettingsInteractorOutput methods
}
