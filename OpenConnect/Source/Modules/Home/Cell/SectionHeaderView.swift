//
//  SectionHeaderView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class SectionHeaderView: UITableViewHeaderFooterView, Reusable {

    private var titleLabel: UILabel = .label(color: .silver40, font: .sectionTitle)

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
        self.contentView.addAutoSubviews([titleLabel])
    }

    private func themeViews() {
        self.tintColor = .background
    }

    private func setupConstraints() {
        titleLabel.edgesToSuperview(insets: UIEdgeInsets(top: 7, left: 24, bottom: 7, right: 24))
    }

    func configure(title: String) {
        titleLabel.text = title
    }
}
