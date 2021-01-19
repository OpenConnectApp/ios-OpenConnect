//
//  SectionSearchBarHeaderView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//

import Foundation
import UIKit

class SectionSearchBarHeaderView: UITableViewHeaderFooterView, Reusable {

    private var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.barTintColor = .background
        sb.layer.cornerRadius = 6
        sb.layer.borderWidth = 1
        sb.layer.borderColor = UIColor.warmBlue.cgColor
        sb.textContentType = .name
        sb.searchTextField.font = .sectionTitle
        sb.searchTextField.textColor = .white
        sb.backgroundColor = .background
        sb.searchTextField.backgroundColor = .background
        return sb
    }()

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
        self.contentView.addAutoSubviews([searchBar])
        searchBar.delegate = self
    }

    private func themeViews() {
        self.tintColor = .backgroundDark
    }

    private func setupConstraints() {
        searchBar.height(44)
        searchBar.edgesToSuperview(insets: UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24))
    }

    func configure(placeholder: String, text: String) {
        searchBar.placeholder = placeholder
        searchBar.text = text
    }
}

extension SectionSearchBarHeaderView: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
