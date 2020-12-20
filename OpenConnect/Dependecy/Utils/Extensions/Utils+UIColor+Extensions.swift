//
//  Utils+UIColor+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit.UIColor

public extension UIColor {

    ///  creates Color from hexadecimal string with optional transparency (if applicable).
    ///
    /// - Parameters:
    ///     - hexString: hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
    ///     - alpha: optional transparency value (default is 1).
    /// - Example:
    ///     - let redColor = UIColor(hexString: "#FF0000")
    convenience init(hexString: String, alpha: CGFloat = 1) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner: Scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")

        var color: UInt32 = 0
        guard scanner.scanHexInt32(&color) else {
            fatalError("invalid color")
        }
        let rgbColor: CGFloat = 255.0
        let red = CGFloat((color & 0xFF0000) >> 16) / rgbColor
        let green = CGFloat((color & 0x00FF00) >> 8) / rgbColor
        let blue = CGFloat((color & 0x0000FF) >> 0) / rgbColor

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    /// Initializes UIColor with an integer and alpha value.
    ///
    /// - Parameters:
    ///     - value: The integer value of the color. E.g. `0xFF0000` is red, `0x0000FF` is blue.
    ///     - alpha: The alpha value.
    convenience init(_ value: Int, alpha: CGFloat = 1.0) {
        let components = UIColor.getColorComponents(value)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }

    /// Initializes UIColor with an integer and alpha value.
    ///
    /// - Parameters:
    ///   - value: The integer value of the color. E.g. `0xFF0000` is red, `0x0000FF` is blue.
    /// - returns tuple with r, g, b CGFloat values
    private static func getColorComponents(_ value: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        let r = CGFloat(value >> 16 & 0xFF0000) / 255.0
        let g = CGFloat(value >> 8 & 0x00FF00) / 255.0
        let b = CGFloat(value & 0x0000FF) / 255.0

        return (r, g, b)
    }

    ///  convinience initialiser to create UIColor from Int red, green, blue component values and optional alpha (if applicable).
    /// - Parameters:
    ///     - red: red component CGFloat value ( should be between 0 - 255)
    ///     - green: green component CGFloat value
    ///     - blue: blue component value
    ///     - alpha: alpha component value
    /// - Example:
    ///     let redColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
