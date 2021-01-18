//
//  HomeExchangesHeaderTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class HomeExchangesHeaderTVCell: UITableViewCell, Reusable {

    private var avalBalLabel: UILabel = .label(color: .silver40, font: UIFont(.montserrat(.medium), size: 12))

    private var balLabel: UILabel = .label(color: .silver, font: UIFont(.montserrat(.semiBold), size: 20))

    private var growthLabel: UILabel = .label(color: .aquamarine, font: UIFont(.montserrat(.semiBold), size: 16))

    private var growthDaysLabel: UILabel = .label(color: .silver40, font: UIFont(.montserrat(.medium), size: 10))

    private var graphView: UIView = .view(background: .clear)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        self.selectionStyle = .none
        self.contentView.addAutoSubviews([avalBalLabel, balLabel, growthLabel, growthDaysLabel, graphView])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        avalBalLabel.leadingToSuperview(offset: 24)
        avalBalLabel.topToSuperview(offset: 20)

        balLabel.leadingToSuperview(offset: 24)
        balLabel.topToBottom(of: avalBalLabel, offset: 1)

        growthLabel.trailingToSuperview(offset: 24)
        growthLabel.topToSuperview(offset: 25)

        growthDaysLabel.trailingToSuperview(offset: 24)
        growthDaysLabel.topToBottom(of: growthLabel, offset: 0)

        graphView.edgesToSuperview(excluding: .top)
        graphView.topToBottom(of: balLabel, offset: 20)
        graphView.aspectRatio(1)
    }

    func configure() {
        avalBalLabel.text = "Available Balance"
        balLabel.text = "INR 16.403cr"
        growthLabel.text = "2.54%"
        growthDaysLabel.text = "in 30 days"
    }
}
