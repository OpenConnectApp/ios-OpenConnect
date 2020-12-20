//
//  UIFont+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit.UIFont

public extension UIFont {

    /// convenience init to create UIFont instance from FontName enum and font size
    /// - Parameters:
    ///   - font: represents FontName containing font family name used eg. FontName.ProximaNova.bold
    ///   - size: CGFloat value representing the font size eg. 17
    /// - Example:
    ///     - let boldFont = UIFont(.proximaNova(.bold), size: 17)
    ///
    convenience init(_ font: FontName, size: CGFloat) {
        self.init(name: font.name, size: size)!
    }

    /// convenience init to create UIFont instance from ProximaNova enum and font size
    /// - Parameters:
    ///   - font: represents ProximaNova font family eg. ProximaNova.bold
    ///   - size: CGFloat value representing the font size eg. 17
    /// - Example:
    ///     - let regularFont = UIFont(ProximaNova.regular), size: 17)
    convenience init(_ font: Montserrat, size: CGFloat) {
        self.init(name: font.rawValue, size: size)!
    }

    static func font(_ font: Montserrat, size: FontSize) -> UIFont {
        guard let font = UIFont(name: font.rawValue, size: size.value) else {
            fatalError("Inavlid Font Family or Size")
        }
        return font
    }
}
