//
//  Utils+UIViewController+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit
import SafariServices

public extension UIViewController {

    /// To open valid url in safari view controller out of the app
    /// - Parameter urlString: a url string
    func openUrlInSafariViewController(urlString: String) {
        if let url = URL(string: urlString) {
            let configuration = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: url, configuration: configuration)
            vc.preferredBarTintColor = .background
            present(vc, animated: true, completion: nil)
        }
    }
}
