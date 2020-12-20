//
//  ModuleBuilder.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit.UIViewController

// MARK: ModuleBuilder

public protocol ModuleBuilder {

    associatedtype ModuleDependency = Void
    associatedtype Payload = Void
    associatedtype ViewController: UIViewController

    static func buildModule(dependency: ModuleDependency, payload: Payload) -> ViewController
}
