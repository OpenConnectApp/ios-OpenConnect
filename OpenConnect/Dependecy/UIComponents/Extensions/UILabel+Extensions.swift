//
//  UILabel+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UILabel {

    public static func label(
        text: String? = nil,
        color: UIColor = .white,
        font: UIFont,
        numOfLines: Int = 1,
        background: UIColor? = nil,
        alignment: NSTextAlignment = .left,
        linebreakMode: NSLineBreakMode = .byTruncatingTail,
        cornerRadius: CGFloat = 0.0
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = font
        label.backgroundColor = background ?? .clear
        label.numberOfLines = numOfLines
        label.textAlignment = alignment
        label.lineBreakMode = linebreakMode
        label.addCornerRadius(cornerRadius)
        label.useAutolayout()
        return label
    }

    public convenience init(text: String) {
        self.init()
        self.text = text
    }

    public convenience init(
        text: String? = nil,
        color: UIColor = .white,
        font: UIFont,
        background: UIColor? = nil,
        numOfLines: Int = 1,
        alignment: NSTextAlignment = .left,
        linebreakMode: NSLineBreakMode = .byTruncatingTail,
        cornerRadius: CGFloat = 0.0
    ) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = font
        self.numberOfLines = numOfLines
        self.backgroundColor = background ?? .clear
        self.textAlignment = alignment
        self.lineBreakMode = linebreakMode
        self.addCornerRadius(cornerRadius)
        self.useAutolayout()
    }
}
