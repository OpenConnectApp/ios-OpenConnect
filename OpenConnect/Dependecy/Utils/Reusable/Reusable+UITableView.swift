//
//  Reusable+UITableView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public extension UITableView {

    // MARK: UITableViewCell

    final func register<T: UITableViewCell>(_ cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    final func register<T: UITableViewCell>(_ cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(T.reuseIdentifier) matching type \(T.self).")
        }
        return cell
    }

    // MARK: UITableViewHeaderFooterView

    final func register<T: UITableViewHeaderFooterView>(_ headerFooterViewType: T.Type) where T: NibReusable {
        register(headerFooterViewType.nib, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    final func register<T: UITableViewHeaderFooterView>(_ headerFooterViewType: T.Type) where T: Reusable {
        register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ cellType: T.Type = T.self) -> T where T: Reusable {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Failed to dequeue a headerFooterView with identifier \(T.reuseIdentifier) matching type \(T.self).")
        }
        return headerFooterView
    }
}
