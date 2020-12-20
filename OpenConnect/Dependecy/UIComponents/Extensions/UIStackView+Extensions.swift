//
//  UIStackView+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UIStackView {

    public static func stackView(
        subviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fillProportionally,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0.0
    ) -> UIStackView {
        return UIStackView(
            subviews: subviews,
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing
        )
    }

    public convenience init(
        subviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fillProportionally,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0.0
    ) {
        self.init(arrangedSubviews: subviews)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}
