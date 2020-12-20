//
//  Theme.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

class Theme {

    static let shared: Theme = Theme()
    
    private init() {
    }

    func themeNavigationBarApperance() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barStyle = .black
        navAppearance.barTintColor = .background
        navAppearance.tintColor = .white
        navAppearance.isTranslucent = false
        themeBarButtonTextAttributes()
        themeBarTitleTextAttributes()
    }
    
    func themeBarButtonTextAttributes() {
        UIBarButtonItem.appearance().setTitleTextAttributesForAllStates()
    }

    func themeBarTitleTextAttributes() {
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(.semiBold, size: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
}
