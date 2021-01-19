//
//  UIView+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UIView {

    public static func view(
        frame: CGRect = .zero,
        background: UIColor = .clear,
        radius: CGFloat = 0.0,
        alpha: CGFloat = 1.0,
        theme: ((UIView) -> Void)? = nil
    ) -> UIView {
        return UIView(
            frame: frame,
            background: background,
            radius: radius,
            alpha: alpha,
            theme: theme
        )
    }

    public convenience init(
        frame: CGRect = .zero,
        background: UIColor = .white,
        radius: CGFloat = 0.0,
        alpha: CGFloat = 1.0,
        theme: ((UIView) -> Void)? = nil
    ) {
        self.init(frame: frame)
        self.backgroundColor = background
        self.addCornerRadius(radius)
        if let _themeClosure = theme {
            self.style(_themeClosure)
        }
    }
}

public extension UIView {

    func addAutoSubview(_ view: UIView) {
        view.useAutolayout()
        addSubview(view)
    }

    func addAutoSubviews(_ views: [UIView]) {
        for view in views {
            addAutoSubview(view)
        }
    }

    func useAutolayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func themeBackground(_ color: UIColor) {
        backgroundColor = color
    }
}

public extension UIView {

    @discardableResult func addSubview<T: UIView>(_ subview: T, _ closure: (T) -> Void) -> T {
        addAutoSubview(subview)
        closure(subview)
        return subview
    }

    @discardableResult func style<View>(_ closure: (View) -> Void) -> View where View: UIView {
        guard let self = self as? View else {
            fatalError("Inavlid \(View.self) view subclass")
        }
        closure(self)
        return self
    }
}

// MARK: CALayer

public extension UIView {

    func addRoundBorder(radius cornerRadius: CGFloat = 5, color: UIColor = UIColor.black, thickness borderWidth: CGFloat = 0.5, alpha: CGFloat = 1) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
        clipsToBounds = true
        self.alpha = alpha
    }

    func addCornerRadius(_ radius: CGFloat = 5) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        clipsToBounds = true
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
