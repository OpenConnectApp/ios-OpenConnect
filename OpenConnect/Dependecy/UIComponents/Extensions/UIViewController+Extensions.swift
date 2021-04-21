//
//  UIViewController+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

enum UINavBar {
    case openconnect
    case title(text: String?)
    case exchange(exchange: Exchange)
}

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

    func removeNavBackButtonText() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func resignKeyboardOnTouchBegan() {
        let gesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(gesture)
    }

    func setNavTitle(showbackBtn: Bool = true, showNavBar: Bool = true, title: String?) {
        setNavigation(showbackBtn: showbackBtn, barType: .title(text: title))
        self.navigationController?.setNavigationBarHidden(!showNavBar, animated: true)
    }

    func setNavigation(showbackBtn: Bool = true, barType: UINavBar) {
        switch barType {
        case .title(let text):
            self.navigationItem.title = text
        default:
            let titleView = getNavBarTitleView(barType: barType)
            self.navigationItem.titleView = titleView
        }

        self.navigationItem.setHidesBackButton(!showbackBtn, animated: true)
        removeNavBackButtonText()
    }

    private func getNavBarTitleView(barType: UINavBar) -> UIView? {
        switch barType {
        case .openconnect:
            return getNavView(title: "OpenConnect", image: Asset.appLogo.image)

        case .exchange(let exchange):
            return getNavView(title: exchange.title, image: exchange.image)

        default:
            return nil
        }
    }

    private func getNavView(title: String, image: UIImage?) -> UIView {
        let titleLabel: UILabel = .label(text: title, color: .silver, font: .headingBig, numOfLines: 1, alignment: .left)
        let icon: UIImageView = .imageView(image: image, contentMode: .scaleAspectFit)

        let container: UIView = .view(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.navigationController?.navigationBar.frame.height ?? 44))
        container.addAutoSubviews([titleLabel, icon])

        icon.width(30)
        icon.aspectRatio(1)
        icon.edgesToSuperview(excluding: .trailing)

        titleLabel.leadingToTrailing(of: icon, offset: 8)
        titleLabel.trailingToSuperview(offset: 5)
        titleLabel.centerYToSuperview()

        return container
    }
}
