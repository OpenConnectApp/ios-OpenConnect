//
//  AddExchangeSwitchView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class AddExchangeSwitchView: UIView {

    private var titleLabel: UILabel = .label(text: "", color: .silver, font: .body, numOfLines: 1)

    private var switchBtn: UISwitch = {
        let btn = UISwitch()
        btn.onTintColor = .warmBlue
        return btn
    }()

    private var divider: UIView = .view(background: UIColor.warmBlue.withAlphaComponent(0.1))

    private var onSwitchValueChangeCompletion: ((Bool) -> Void)?

    var isSwitchOn: Bool {
        get {
            return switchBtn.isOn
        }
        set {
            switchBtn.isOn = newValue
        }
    }

    var isEnabled: Bool = true {
        didSet {
            updateUI()
        }
    }

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
        self.addAutoSubviews([titleLabel, switchBtn, divider])
        updateUI()
        switchBtn.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }

    private func themeViews() {
    }

    private func setupConstraints() {
        titleLabel.edgesToSuperview(excluding: .trailing, insets: UIEdgeInsets(top: 18, left: 10, bottom: 18, right: 0))
        titleLabel.trailingToLeading(of: switchBtn, offset: -10)

        switchBtn.trailingToSuperview(offset: 10)
        switchBtn.centerYToSuperview()

        divider.leadingToSuperview(offset: 10)
        divider.trailingToSuperview(offset: 10)
        divider.bottomToSuperview()
        divider.height(1)
    }

    private func updateUI() {
        titleLabel.textColor = isEnabled ? .silver : .silver40
        switchBtn.isEnabled = isEnabled
    }

    func configure(text: String, isOn: Bool) {
        titleLabel.text = text
        switchBtn.isOn = isOn
    }

    @objc private func switchValueChanged() {
        onSwitchValueChangeCompletion?(switchBtn.isOn)
    }

    func onStateChanged(onChange: @escaping ((_ isSelected: Bool) -> Void)) {
        onSwitchValueChangeCompletion = onChange
    }
}
