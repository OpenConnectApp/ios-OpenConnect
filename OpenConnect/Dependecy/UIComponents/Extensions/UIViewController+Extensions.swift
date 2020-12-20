//
//  UIViewController+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UIViewController {

    public func dismissKeyboard() {
        view.endEditing(true)
    }

    /// Use to add the viewcontroller instance as child and to add as subview
    /// - Parameters:
    ///   - child: Instance of the child viewcontroller
    func add(
        child: UIViewController,
        in container: UIView? = nil,
        configure: (_ childView: UIView) -> Void = { _ in }
    ) {
        addChild(child)
        let contentView = container.unwrap(orDefault: view)
        contentView.addSubview(child.view)
        child.view.frame = contentView.frame
        configure(child.view)
        child.didMove(toParent: self)
    }

    /// Use to remove the already added child controller from parent
    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

    func removeBackButtonText() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func resignKeyboardOnTouchBegan() {
        let gesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(gesture)
    }
}
