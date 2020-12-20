//
//  UIBarButton+Extension.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    private var defaultTitleAttributes: [NSAttributedString.Key: Any]? {
        return [
            NSAttributedString.Key.font: UIFont(.montserrat(.semiBold), size: 12),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }

    private var states: [UIControl.State] {
        return [.normal, .highlighted, .disabled, .focused]
    }

    public func setTitleTextAttributesForAllStates(_ attributes: [NSAttributedString.Key: Any]? = nil) {
        states.forEach { setTitleTextAttributes(attributes ?? defaultTitleAttributes, for: $0) }
    }
}
