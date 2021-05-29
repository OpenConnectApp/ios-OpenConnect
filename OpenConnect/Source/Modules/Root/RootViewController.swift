//
//  RootViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class RootViewController: UITabBarController, RootViewInput {

    // MARK: Properties
    var presenter: RootViewOutput!
    
    // MARK: Initialization
    override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavTitle(title: Strings.NavigationTitle.appName)
        setupViews()
        themeViews()
        setupConstraints()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        let homeVC = HomeModuleBuilder.buildModule(dependency: (), payload: ())
        let homeNC = UINavigationController(rootViewController: homeVC)
        homeNC.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.icTabHomeSelected.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.icTabHomeSelected.image.withRenderingMode(.alwaysOriginal)
        )

        let switchVC = SwitchVC()
        switchVC.view.backgroundColor = .background
        switchVC.navigationItem.title = "Switch Exchange"
        let switchNC = UINavigationController(rootViewController: switchVC)
        switchNC.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.icTabSwitch.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.icTabSwitch.image.withRenderingMode(.alwaysOriginal)
        )

        let settingVC = SettingsModuleBuilder.buildModule(dependency: (), payload: ())
        let settingNC = UINavigationController(rootViewController: settingVC)
        settingNC.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.icTabSetting.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.icTabSetting.image.withRenderingMode(.alwaysOriginal)
        )

        viewControllers = [homeNC, switchNC, settingNC]
        selectedIndex = 0
        self.delegate = self

        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .backgroundDark
        self.tabBar.tintColor = .clear
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
    }
    
    // MARK: RootViewInput
}

extension RootViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: UINavigationController.self),
           ((viewController as? UINavigationController)?.topViewController is SwitchVC) {
            self.presenter.switchExchangeSelected()
            return false
        }
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}

class SwitchVC: UIViewController {
}
