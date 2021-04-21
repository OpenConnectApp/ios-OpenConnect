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
        setNavTitle(title: "OpenConnect")
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

        let settingVC = UIViewController()
        settingVC.view.backgroundColor = .background
        settingVC.navigationItem.title = "Settings"
        let settingNC = UINavigationController(rootViewController: settingVC)
        settingNC.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.icTabSetting.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.icTabSetting.image.withRenderingMode(.alwaysOriginal)
        )

        viewControllers = [homeNC, switchNC, settingNC]
        selectedIndex = 0
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
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}

class SwitchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(1)) {
            self.displaySelectExchange()
        }
    }

    private func displaySelectExchange() {
        let vc = SelectExchangeModuleBuilder.buildModule(dependency: ()) { [weak self] in
            self?.presentSearchExchange()
        }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }

    private func presentSearchExchange() {
        let vc = SearchExchangeModuleBuilder.buildModule(dependency: (), payload: ())
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .overFullScreen
        self.present(nc, animated: true, completion: nil)
    }
}
