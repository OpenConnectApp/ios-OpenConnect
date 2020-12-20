//
//  Optional+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {

    func ifNilOrEmpty(then expression: @autoclosure () -> Wrapped) -> Wrapped {
        guard let value = self, !value.isEmpty else {
            let newView = expression()
            return newView
        }
        return value
    }
}

public extension Optional {

    func ifNil(set expression: @autoclosure () -> Wrapped) -> Wrapped {
        guard let value = self else {
            let newValue = expression()
            return newValue
        }
        return value
    }

    func unwrap(orDefault expression: @autoclosure () -> Wrapped) -> Wrapped {
        guard let value = self else {
            let newView = expression()
            return newView
        }
        return value as Wrapped
    }

    func get() throws -> Wrapped {
        guard let value = self else {
            throw OptionalError.nilValue
        }
        return value
    }
}

public enum OptionalError: Error {
    case nilValue
}
