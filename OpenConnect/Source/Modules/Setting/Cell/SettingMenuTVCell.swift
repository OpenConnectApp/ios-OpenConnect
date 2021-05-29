//
//  SettingMenuTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 28/05/21.
//

import Foundation
import UIKit

class SettingMenuTVCell: UITableViewCell, Reusable {

    private var containerView: UIView = .view()

    private var iconImageView: UIImageView = .imageView()

    private var titleLabel: UILabel = .label(color: .silver, font: .sectionBigTitle)

    private var accessoryImageView: UIImageView = .imageView(image: Asset.icArrow.image)

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
        containerView.addAutoSubviews([iconImageView, titleLabel, accessoryImageView])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        containerView.edgesToSuperview()

        iconImageView.width(24)
        iconImageView.aspectRatio(1)
        iconImageView.leadingToSuperview(offset: 24)
        iconImageView.topToSuperview(offset: 16)
        iconImageView.bottomToSuperview(offset: -16)

        titleLabel.centerYToSuperview()
        titleLabel.leadingToTrailing(of: iconImageView, offset: 12)
        titleLabel.trailingToLeading(of: accessoryImageView, offset: -12)

        accessoryImageView.width(24)
        accessoryImageView.aspectRatio(1)
        accessoryImageView.trailingToSuperview(offset: 24)
        accessoryImageView.centerYToSuperview()
    }

    func configure(menu: SettingMenu) {
        titleLabel.text = menu.title
        iconImageView.image = menu.icon
    }
}
