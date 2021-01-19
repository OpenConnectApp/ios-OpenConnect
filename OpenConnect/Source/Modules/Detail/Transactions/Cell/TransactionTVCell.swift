//
//  TransactionTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class TransactionTVCell: UITableViewCell, Reusable {

    private var containerView: UIView = .view()

    private var iconImageView: UIImageView = .imageView()

    private var typeLabel: UILabel = .label(color: .silver, font: .sectionTitle)

    private var dateLabel: UILabel = .label(color: .silver40, font: .sectionSubTitle)

    private var differenceLabel: UILabel = .label(color: .silver, font: .sectionTitle)

    private var paidLabel: UILabel = .label(color: .silver40, font: .sectionSubTitle)

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
        containerView.addAutoSubviews([iconImageView, typeLabel, dateLabel, differenceLabel, paidLabel])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        containerView.edgesToSuperview()

        iconImageView.width(24)
        iconImageView.aspectRatio(1)
        iconImageView.leadingToSuperview(offset: 24)
        iconImageView.centerYToSuperview()

        typeLabel.topToSuperview(offset: 12)
        typeLabel.leadingToTrailing(of: iconImageView, offset: 12)
        typeLabel.trailingToLeading(of: differenceLabel, offset: -12)

        dateLabel.topToBottom(of: typeLabel, offset: 5)
        dateLabel.leadingToTrailing(of: iconImageView, offset: 12)
        dateLabel.trailingToLeading(of: paidLabel, offset: -12)
        dateLabel.bottomToSuperview(offset: -12)

        differenceLabel.trailingToSuperview(offset: 24)
        differenceLabel.topToSuperview(offset: 12)

        paidLabel.topToBottom(of: differenceLabel, offset: 5)
        paidLabel.bottomToSuperview(offset: -12)
        paidLabel.trailingToSuperview(offset: 24)

        paidLabel.setContentHuggingPriority(.required, for: .horizontal)
        paidLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        differenceLabel.setContentHuggingPriority(.required, for: .horizontal)
        differenceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    func configure(indexPath: IndexPath) {
        if indexPath.row.isMultiple(of: 2) {
            iconImageView.image = Asset.icUpRound.image
            typeLabel.text = "Buy"
            dateLabel.text = "Sep 22, 2020 15:15"
            differenceLabel.text = "0.28009 BTC"
            paidLabel.text = "Paid 3099.67 USDT"
        } else {
            iconImageView.image = Asset.icDownRound.image
            typeLabel.text = "Sell"
            dateLabel.text = "Sep 21, 2020 21:48"
            differenceLabel.text = "0.145 BTC"
            paidLabel.text = "Paid 3099.67 USDT"
        }
    }
}
