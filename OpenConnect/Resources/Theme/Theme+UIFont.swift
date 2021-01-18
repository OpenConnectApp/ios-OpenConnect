//
//  Theme+UIFont.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public enum FontName: Equatable {

    case montserrat(Montserrat)

    // name will return font name rawValue
    var name: String {
        switch self {
        case .montserrat(let fontName):
            return fontName.rawValue
        }
    }
}

public enum Montserrat: String, RawRepresentable {
    case light = "Montserrat-Light"
    case regular = "Montserrat-Regular"
    case medium = "Montserrat-Medium"
    case semiBold = "Montserrat-Semibold"
    case bold = "Montserrat-Bold"
}

public enum FontSize {
    case small
    case medium
    case semiBold
    case bold
    case custom(CGFloat)

    var value: CGFloat {
        switch self {
        case .small:
            return 12
        case .medium:
            return 14
        case .semiBold:
            return 14
        case .bold:
            return 14
        case .custom(let size):
            return size
        }
    }
}

public extension UIFont {

    static let title = UIFont(.montserrat(.bold), size: 28)

    static let heading = UIFont(.montserrat(.semiBold), size: 14)

    static let sectionBigTitle = UIFont(.montserrat(.medium), size: 18)

    static let sectionTitle = UIFont(.montserrat(.medium), size: 14)

    static let sectionSubTitle = UIFont(.montserrat(.medium), size: 12)
    
    static let body = UIFont(.montserrat(.regular), size: 16)

    static let bodyMedium = UIFont(.montserrat(.regular), size: 14)

    static let button = UIFont(.montserrat(.semiBold), size: 16)

    static let buttonSmall = UIFont(.montserrat(.semiBold), size: 12)
}
