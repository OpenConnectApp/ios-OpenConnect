//
//  UITableView+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public extension UITableView {

    static func tableview(
        tablefooterView: UIView = .init(frame: .zero),
        rowHeight: CGFloat = 48,
        backgroundColor: UIColor = .clear,
        bounces: Bool = true
    ) -> UITableView {
        return UITableView(
            tablefooterView: tablefooterView,
            rowHeight: rowHeight,
            backgroundColor: backgroundColor,
            bounces: bounces
        )
    }

    convenience init(
        tablefooterView: UIView = .init(frame: .zero),
        rowHeight: CGFloat = 48,
        backgroundColor: UIColor = .clear,
        bounces: Bool = true
    ) {
        self.init()
        self.tableFooterView = tableFooterView
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = rowHeight
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.separatorStyle = .none
        self.backgroundColor = backgroundColor
        self.bounces = bounces
        self.useAutolayout()
    }
}
