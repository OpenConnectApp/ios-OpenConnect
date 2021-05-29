//
//  SettingMenuFooterTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 28/05/21.
//

import Foundation
import UIKit

class SettingMenuFooterTVCell: UITableViewCell, Reusable {

    private var containerView: UIView = .view()

    private var termsBtn: UIButton = .button(color: .silver, font: .sectionTitle)

    private var versionLabel: UILabel = .label(color: .silver40, font: .bodySmall)

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
        containerView.addAutoSubviews([termsBtn, versionLabel])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        containerView.edgesToSuperview()

        termsBtn.centerXToSuperview()
        termsBtn.topToSuperview(offset: 30)

        versionLabel.centerXToSuperview()
        versionLabel.topToBottom(of: termsBtn, offset: 0)
        versionLabel.bottomToSuperview(offset: -30)
    }

    func configure() {
        termsBtn.setTitleForAllStates("Privacy Policy and Terms of Service")
        versionLabel.text = "App version 1.0.0, Build 100200020"
    }
}
