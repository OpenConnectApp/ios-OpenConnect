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

    var selectedLabelColor: UIColor = .warmBlue

    var labelColor: UIColor = .silver40

    var selectedLabelFont: UIFont = .sectionSubTitle

    var labelFont: UIFont = .sectionSubTitle

    var selectedBorderColor: UIColor = .warmBlue

    var labelBgColor: UIColor = .darkGreyBlue

    var selectedLabelBgColor: UIColor = .darkGreyBlue

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
        titleLabel.textColor = isSelected ? selectedLabelColor : labelColor
        titleLabel.font = isSelected ? selectedLabelFont : labelFont
        bgView.backgroundColor = isSelected ? selectedLabelBgColor : labelBgColor
        bgView.layer.borderColor = isSelected ? selectedBorderColor.cgColor : UIColor.clear.cgColor
    }
}
