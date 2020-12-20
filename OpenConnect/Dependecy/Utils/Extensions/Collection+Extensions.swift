//
//  Collection+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

public extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        // return indices.contains(index) ? self[index] : nil
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}

extension Collection {
    var isNonEmpty: Bool {
        return !isEmpty
    }
}
