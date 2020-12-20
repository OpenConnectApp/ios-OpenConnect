//
//  ExchangeTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit
import TinyConstraints

class SelectExchangeTVCell: UITableViewCell, Reusable {

    private var titleLabel: UILabel = .label(color: .silver, font: .body)

    private var iconImageView: UIImageView = .imageView()

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
        self.contentView.addAutoSubviews([iconImageView, titleLabel])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        iconImageView.width(28)
        iconImageView.aspectRatio(1)

        iconImageView.leadingToSuperview(offset: 34)
        iconImageView.topToSuperview(offset: 12)
        iconImageView.bottomToSuperview(offset: -12)

        titleLabel.leadingToTrailing(of: iconImageView, offset: 12)
        titleLabel.centerYToSuperview()
        titleLabel.trailingToSuperview(offset: 34)
    }

    func configure(exchange: Exchange) {
        titleLabel.text = exchange.title
        iconImageView.image = exchange.image
    }
}
