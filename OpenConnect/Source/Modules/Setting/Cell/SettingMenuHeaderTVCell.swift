//
//  SettingMenuHeaderTVCell.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 28/05/21.
//

import Foundation
import UIKit

class SettingMenuHeaderTVCell: UITableViewCell, Reusable {

    private var containerView: UIView = .view()

    private var signInBtn: UIButton = .button(title: "SIGN IN", color: .silver, font: .button, radius: 3) { (btn) in
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.silver.cgColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }

    private var signUpBtn: UIButton = .button(title: "REGISTER", color: .silver, font: .button, backgroundColor: .aquamarine, radius: 3) { (btn) in
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.aquamarine.cgColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }

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
        containerView.addAutoSubviews([signInBtn, signUpBtn])
    }

    private func themeViews() {
        self.backgroundColor = .clear
    }

    private func setupConstraints() {
        containerView.edgesToSuperview()

        signInBtn.leadingToSuperview(offset: 20)
        signInBtn.topToSuperview(offset: 24)
        signInBtn.bottomToSuperview(offset: -20)
        signInBtn.trailingToSuperview(containerView.centerXAnchor, offset: 5)

        signUpBtn.trailingToSuperview(offset: 20)
        signUpBtn.topToSuperview(offset: 24)
        signUpBtn.bottomToSuperview(offset: -20)
        signUpBtn.leadingToSuperview(containerView.centerXAnchor, offset: 5)
    }

    func configure() {

    }
}
