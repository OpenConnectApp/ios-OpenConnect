//
//  UITextField+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//

import Foundation
import UIKit

extension UITextField {

    func placeholder(text: String, color: UIColor) {
        let attr: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: color
        ]
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attr)
    }
}
