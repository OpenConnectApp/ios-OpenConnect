//
//  RootRouter.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class RootRouter: RootRouterInput {

    // MARK: Properties
    private weak var viewController: RootViewController?
    
    // MARK: Initialiser
    init(viewController: RootViewController) {
        self.viewController = viewController
    }
    
    private var topViewController: UIViewController? {
        return UIApplication.shared.topViewController()
    }
    
    // MARK: RootRouterInput methods
    func showSwitchExchange(delegate: SelectExchangeDelegate) {
        let vc = SelectExchangeModuleBuilder.buildModule(dependency: (), payload: (DataRepo.exchanges, AppDataServiceImpl.currentSelectedExchange, delegate))
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.viewController?.present(vc, animated: true, completion: nil)
    }

    func showAddNewExchange() {
        let vc = SearchExchangeModuleBuilder.buildModule(dependency: DependencyContainer.shared, payload: ())
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .overFullScreen
        self.viewController?.present(nc, animated: true, completion: nil)
    }

    func showExchangeOverview(exchange: Exchange, selectedIndex: Int) {
        guard let topVC = topViewController else {
            return
        }
        if topVC.isKind(of: HomeViewController.self) {
            AppDataServiceImpl.currentSelectedExchange = selectedIndex
            let vc = ProfileRootModuleBuilder.buildModule(dependency: (), payload: .exchange(exchange: exchange))
            topVC.navigationController?.pushViewController(vc, animated: true)
            return
        } else if topVC.isKind(of: ProfileRootViewController.self) {
            AppDataServiceImpl.currentSelectedExchange = selectedIndex
            let vc = ProfileRootModuleBuilder.buildModule(dependency: (), payload: .exchange(exchange: exchange))
            var vcs = topVC.navigationController?.viewControllers ?? []
            vcs.removeLast()
            vcs.append(vc)
            topVC.navigationController?.viewControllers = vcs
            return
        }
        guard let rootVc = topVC.navigationController?.parent as? RootViewController,
              let navigationController = rootVc.viewControllers?[0] as? UINavigationController,
              let navTopVC = navigationController.topViewController else {
            return
        }
        rootVc.selectedIndex = 0
        AppDataServiceImpl.currentSelectedExchange = selectedIndex
        let vc = ProfileRootModuleBuilder.buildModule(dependency: (), payload: .exchange(exchange: exchange))
        if navTopVC.isKind(of: ProfileRootViewController.self) {
            var vcs = navigationController.viewControllers
            vcs.removeLast()
            vcs.append(vc)
            navigationController.viewControllers = vcs
        } else {
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
