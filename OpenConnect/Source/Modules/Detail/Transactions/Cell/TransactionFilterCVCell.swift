//
//  TransactionFilterCVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class TransactionFilterCVCell: UICollectionViewCell, Reusable {

    private var bgView: UIView = .view(background: .darkGreyBlue)

    private var titleLabel: UILabel = .label(color: .silver40, font: .sectionSubTitle, numOfLines: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupViews()
        themeViews()
        setupConstraints()
    }

    private func setupViews() {
        self.contentView.addAutoSubviews([bgView])
        bgView.addAutoSubviews([titleLabel])
    }

    private func themeViews() {
        self.backgroundColor = .clear

        bgView.layer.cornerRadius = 16
        bgView.layer.borderWidth = 1
    }

    private func setupConstraints() {
        bgView.edgesToSuperview()
        titleLabel.edgesToSuperview(insets: UIEdgeInsets(top: 7, left: 12, bottom: 7, right: 12))
    }

    func configure(title: String, indexPath: IndexPath, isSelected: Bool) {
        titleLabel.text = title
        titleLabel.textColor = isSelected ? .warmBlue : .silver40
        bgView.layer.borderColor = isSelected ? UIColor.warmBlue.cgColor : UIColor.clear.cgColor
    }
}
