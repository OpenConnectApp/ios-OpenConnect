//
//  String+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

public extension String {

    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }

    var trimmed: String {
        return trimmingCharacters(in: .whitespaces)
    }

    func isValidEmail() -> Bool {
        let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }

    func toBool() -> Bool {
        switch self {
        case "True", "true", "yes", "YES":
            return true
        case "False", "false", "no", "NO":
            return false
        default:
            return false
        }
    }

    func contains(find: String) -> Bool {
        return range(of: find) != nil
    }

    func removingAllSpaces() -> String {
        return replacingOccurrences(of: " ", with: "")
    }
}
