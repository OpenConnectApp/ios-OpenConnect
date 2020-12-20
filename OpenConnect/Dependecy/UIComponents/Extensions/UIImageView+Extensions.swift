//
//  UIImageView+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

extension UIImageView {

    public static func imageView(
        image: UIImage? = nil,
        contentMode: UIView.ContentMode = .scaleAspectFill,
        background: UIColor? = nil,
        cornerRadius: CGFloat = 0.0,
        isUserInteractionEnabled: Bool = false
    ) -> UIImageView {
        return UIImageView(
            image: image,
            contentMode: contentMode,
            background: background,
            cornerRadius: cornerRadius,
            isUserInteractionEnabled: isUserInteractionEnabled
        )
    }

    public convenience init(
        image: UIImage? = nil,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        background: UIColor? = nil,
        cornerRadius: CGFloat = 0.0,
        isUserInteractionEnabled: Bool = false
    ) {
        self.init(image: image)
        self.contentMode = contentMode
        self.backgroundColor = background ?? .clear
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.addCornerRadius(cornerRadius)
        self.useAutolayout()
    }
}
