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

    private var tickIcon: UIImageView = .imageView(image: Asset.icRoundTick.image, contentMode: .scaleAspectFit)

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
        self.contentView.addAutoSubviews([iconImageView, titleLabel, tickIcon])
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

        tickIcon.width(20)
        tickIcon.aspectRatio(1)
        tickIcon.centerYToSuperview()
        tickIcon.trailingToSuperview(offset: 24)

        titleLabel.leadingToTrailing(of: iconImageView, offset: 12)
        titleLabel.centerYToSuperview()
        titleLabel.trailingToLeading(of: tickIcon, offset: -10)
    }

    func configure(exchange: Exchange, indexPath: IndexPath, isSelected: Bool = false) {
        titleLabel.text = exchange.title
        iconImageView.setImage(with: exchange.imageUrl)
        tickIcon.isHidden = !isSelected
    }
}
