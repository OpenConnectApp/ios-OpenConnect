//
//  CurrencyTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//

import Foundation
import UIKit
import TinyConstraints

class CurrencyTVCell: UITableViewCell, Reusable {

    private var titleLabel: UILabel = .label(color: .silver, font: .sectionTitle)

    private var symbolLabel: UILabel = .label(color: .silver40, font: .sectionTitle)

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
        self.contentView.addAutoSubviews([iconImageView, titleLabel, symbolLabel, tickIcon])
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

        symbolLabel.leadingToTrailing(of: titleLabel, offset: 10)
        symbolLabel.centerYToSuperview()
        symbolLabel.trailingToLeading(of: tickIcon, offset: -10, relation: .equalOrGreater, priority: .defaultLow)
    }

    func configure(currency: Currency, indexPath: IndexPath, isSelected: Bool = false) {
        titleLabel.text = currency.title
        iconImageView.image = currency.image
        tickIcon.isHidden = !isSelected
        symbolLabel.text = currency.symbol
    }
}
