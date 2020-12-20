//
//  Utils+UIApplication+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public extension UIApplication {

    func openUrl(_ url: URL, completion: ((Bool) -> Void)? = nil) {
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
            completion?(success)
        })
    }

    func openCustomURL(_ scheme: String) {
        guard let url = URL(string: scheme) else {
            return
        }
        UIApplication.shared.openUrl(url)
    }
}
