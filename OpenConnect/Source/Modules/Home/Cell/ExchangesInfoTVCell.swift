//
//  ExchangesInfoTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class ExchangesInfoTVCell: UITableViewCell, Reusable {

    private var containerView: UIView = .view(background: .darkGreyBlue)

    private var exchangeIcon: UIImageView = .imageView()

    private var exchangeNameLabel: UILabel = .label(color: .silver, font: .sectionTitle)

    private var balLabel: UILabel = .label(color: UIColor.silver.withAlphaComponent(0.4), font: .sectionSubTitle)

    private var growthLabel: UILabel = .label(color: .aquamarine, font: .sectionSubTitle)

    private var priceLabel: UILabel = .label(color: .silver, font: .heading)

    private var priceBtcLabel: UILabel = .label(color: .steel, font: .sectionSubTitle)

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
        self.contentView.addAutoSubview(containerView)
        containerView.addAutoSubviews([exchangeIcon, exchangeNameLabel, balLabel, growthLabel, priceLabel, priceBtcLabel])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        containerView.edgesToSuperview(insets: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 5))

        exchangeIcon.width(28)
        exchangeIcon.aspectRatio(1)
        exchangeIcon.leadingToSuperview(offset: 16)
        exchangeIcon.centerYToSuperview()

        exchangeNameLabel.leadingToTrailing(of: exchangeIcon, offset: 8)
        exchangeNameLabel.topToSuperview(offset: 12)
        exchangeNameLabel.trailingToLeading(of: priceLabel, offset: 8)

        balLabel.leadingToTrailing(of: exchangeIcon, offset: 8)
        balLabel.topToBottom(of: exchangeNameLabel, offset: 2)
        balLabel.bottomToSuperview(offset: -12)

        growthLabel.leadingToTrailing(of: balLabel, offset: 15)
        growthLabel.centerY(to: balLabel)

        priceLabel.trailingToSuperview(offset: 16)
        priceLabel.topToSuperview(offset: 12)

        priceBtcLabel.trailingToSuperview(offset: 16)
        priceBtcLabel.topToBottom(of: priceLabel, offset: 2)
        priceBtcLabel.bottomToSuperview(offset: -12)
    }

    func configure(exchange: Exchange) {
        exchangeIcon.image = exchange.image
        exchangeNameLabel.text = exchange.title
        priceLabel.text = "INR 6.08cr"
        priceBtcLabel.text = "3.705 BTC"
        balLabel.text = "15% Bal."
        growthLabel.text = "+0.51%"
    }
}
