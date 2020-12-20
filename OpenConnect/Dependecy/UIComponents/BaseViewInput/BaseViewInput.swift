//
//  BaseViewInput.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public protocol BaseViewInput: UIViewController {
    func showSpinner()
    func hideSpinner()
    func showSpinner(message: String)
    func showError(title: String?, message: String)
    func showSnackbar(with message: String)
}

public extension BaseViewInput where Self: UIViewController {

    func showSpinner() {
    }

    func hideSpinner() {
    }

    func showSpinner(message: String) {
    }

    func showError(title: String?, message: String) {
    }

    func showSnackbar(with message: String) {
    }
}
