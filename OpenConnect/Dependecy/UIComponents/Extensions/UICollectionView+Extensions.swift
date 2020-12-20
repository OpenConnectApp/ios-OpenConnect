//
//  UICollectionView+Extensions.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public extension UICollectionView {

    static func collectionview(
        scrollDirection: UICollectionView.ScrollDirection = .vertical,
        minimumInteritemSpacing: CGFloat = 12,
        minimumLineSpacing: CGFloat = 12,
        itemSize: CGSize = CGSize(width: 120, height: 40),
        sectionInset: UIEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12),
        backgroundColor: UIColor = .clear,
        bounces: Bool = true,
        pinSectionHeader: Bool = false,
        pinSectionFooter: Bool = false
    ) -> UICollectionView {
        return UICollectionView(
            scrollDirection: scrollDirection,
            minimumInteritemSpacing: minimumInteritemSpacing,
            minimumLineSpacing: minimumLineSpacing,
            itemSize: itemSize,
            sectionInset: sectionInset,
            backgroundColor: backgroundColor,
            bounces: bounces,
            pinSectionHeader: pinSectionHeader,
            pinSectionFooter: pinSectionFooter
        )
    }

    convenience init(
        scrollDirection: UICollectionView.ScrollDirection = .vertical,
        minimumInteritemSpacing: CGFloat = 12,
        minimumLineSpacing: CGFloat = 12,
        itemSize: CGSize = CGSize(width: 120, height: 40),
        sectionInset: UIEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12),
        backgroundColor: UIColor = .clear,
        bounces: Bool = true,
        pinSectionHeader: Bool = false,
        pinSectionFooter: Bool = false
    ) {
        let layout: UICollectionViewFlowLayout = .flowLayout(
            scrollDirection: scrollDirection,
            minimumInteritemSpacing: minimumInteritemSpacing,
            minimumLineSpacing: minimumLineSpacing,
            itemSize: itemSize,
            estimatedItemSize: UICollectionViewFlowLayout.automaticSize,
            sectionInset: sectionInset,
            pinSectionHeader: pinSectionHeader,
            pinSectionFooter: pinSectionFooter
        )

        self.init(frame: .zero, collectionViewLayout: layout)

        self.showsHorizontalScrollIndicator = pinSectionHeader
        self.showsVerticalScrollIndicator = pinSectionFooter
        self.bounces = bounces
        self.backgroundColor = backgroundColor
        self.useAutolayout()
    }
}

extension UICollectionViewFlowLayout {

    /// for dynamic collectionviewcell don't assign itemSize and use itemSize property for fixed size cells

    public static func flowLayout(
        scrollDirection: UICollectionView.ScrollDirection = .vertical,
        minimumInteritemSpacing: CGFloat = 0,
        minimumLineSpacing: CGFloat = 0,
        itemSize: CGSize = .zero,
        estimatedItemSize: CGSize = UICollectionViewFlowLayout.automaticSize,
        sectionInset: UIEdgeInsets = .zero,
        pinSectionHeader: Bool = false,
        pinSectionFooter: Bool = false
    ) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.sectionHeadersPinToVisibleBounds = pinSectionHeader
        layout.sectionFootersPinToVisibleBounds = pinSectionFooter
        layout.sectionInset = sectionInset
        if itemSize == .zero {
            layout.estimatedItemSize = estimatedItemSize
        } else {
            layout.itemSize = itemSize
        }
        return layout
    }
}
