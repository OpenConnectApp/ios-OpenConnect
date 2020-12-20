//
//  Reusable+UICollectionView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public extension UICollectionView {

    // MARK: UICollectionViewCell

    final func register<T: UICollectionViewCell>(_ cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func register<T: UICollectionViewCell>(_ cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(T.reuseIdentifier) matching type \(T.self).")
        }
        return cell
    }

    // MARK: UICollectionReusableView

    final func register<T: UICollectionReusableView>(_ supplementaryViewType: T.Type, ofKind elementKind: UICollectionView.SectionHeaderFooterElementKind)
        where T: NibReusable {
        register(
            supplementaryViewType.nib,
            forSupplementaryViewOfKind: elementKind.rawValue,
            withReuseIdentifier: supplementaryViewType.reuseIdentifier
        )
    }

    final func register<T: UICollectionReusableView>(_ supplementaryViewType: T.Type, ofKind elementKind: UICollectionView.SectionHeaderFooterElementKind)
        where T: Reusable {
        register(
            supplementaryViewType.self,
            forSupplementaryViewOfKind: elementKind.rawValue,
            withReuseIdentifier: supplementaryViewType.reuseIdentifier
        )
    }

    final func dequeueReusableSupplementaryView<T: UICollectionReusableView>
    (ofKind elementKind: String, for indexPath: IndexPath, viewType: T.Type = T.self) -> T
        where T: Reusable {
        let view = dequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: viewType.reuseIdentifier,
            for: indexPath
        )
        guard let typedView = view as? T else {
            fatalError(
                "Failed to dequeue a supplementary view with identifier \(viewType.reuseIdentifier) "
                    + "matching type \(viewType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the supplementary view beforehand"
            )
        }
        return typedView
    }
}

public extension UICollectionView {

    enum SectionHeaderFooterElementKind: Equatable, Comparable {
        case header
        case footer

        public var rawValue: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
}
