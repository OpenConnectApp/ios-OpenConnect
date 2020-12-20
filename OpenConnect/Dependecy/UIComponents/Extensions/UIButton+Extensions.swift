//
//  UIButton+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public extension UIButton {

    static func button(
        type: UIButton.ButtonType = .system,
        title: String? = nil,
        color: UIColor? = nil,
        font: UIFont? = nil,
        backgroundColor: UIColor? = nil,
        radius: CGFloat = 0.0,
        theme: ((UIButton) -> Void)? = nil
    ) -> UIButton {
        return UIButton(
            type: type,
            title: title,
            color: color,
            font: font,
            backgroundColor: backgroundColor,
            radius: radius
        )
    }

    convenience init(
        type: UIButton.ButtonType = .system,
        title: String? = nil,
        color: UIColor? = nil,
        font: UIFont? = nil,
        backgroundColor: UIColor? = nil,
        radius: CGFloat = 0.0,
        theme: ((UIButton) -> Void)? = nil
    ) {
        self.init(type: type)
        self.setTitleForAllStates(title)
        self.setTitleColorForAllStates(color)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.addCornerRadius(radius)
        self.useAutolayout()
        if let _themeClosure = theme {
            self.style(_themeClosure)
        }
    }
}

public extension UIButton {

    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .focused, .disabled]
    }

    func setTitleForAllStates(_ title: String?) {
        states.forEach { setTitle(title, for: $0) }
    }

    func setImageForAllStates(_ image: UIImage?) {
        states.forEach { setImage(image, for: $0) }
    }

    func setBackgroundImageForAllStates(_ image: UIImage?) {
        states.forEach { setBackgroundImage(image, for: $0) }
    }

    func setTitleColorForAllStates(_ color: UIColor?) {
        states.forEach { setTitleColor(color, for: $0) }
    }

    /// Add image on left view
    /// - Parameters:
    ///   - image: pass the image to set it on the left side of button
    func leftImage(image: UIImage? = nil, customInset: UIEdgeInsets? = nil) {

        guard let image = (image != nil ? image : currentImage) else {
            return
        }
        setImage(image, for: .normal)
        var inset = UIEdgeInsets()
        if let customInset = customInset {
            inset = customInset
        } else {
            let right = frame.width / 2
            let left = image.size.width / 2
            inset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        }

        imageEdgeInsets = inset
    }
}
