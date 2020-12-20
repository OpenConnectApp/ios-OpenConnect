//
//  UIApplication+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UIApplication {

    public var mainKeyWindow: UIWindow? {
        return windows.first(where: { $0.isKeyWindow }) ?? keyWindow
    }

    public var rootViewController: UIViewController? {
        guard let keyWindow = UIApplication.shared.mainKeyWindow, let rootViewController = keyWindow.rootViewController else {
            return nil
        }
        return rootViewController
    }

    public func topViewController(controller: UIViewController? = UIApplication.shared.rootViewController) -> UIViewController? {

        if controller == nil {
            return topViewController(controller: rootViewController)
        }

        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let tabController = controller as? UITabBarController {
            if let selectedViewController = tabController.selectedViewController {
                return topViewController(controller: selectedViewController)
            }
        }

        if let presentedViewController = controller?.presentedViewController {
            return topViewController(controller: presentedViewController)
        }

        return controller
    }
}
