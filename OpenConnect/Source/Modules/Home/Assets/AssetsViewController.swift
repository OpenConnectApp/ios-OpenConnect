//
//  AssetsViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class AssetsViewController: UIViewController, AssetsViewInput {

    // MARK: Properties
    var presenter: AssetsViewOutput!
    
    private var tableView: UITableView = .tableview()
    
    // MARK: Initialization
    override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        themeViews()
        setupConstraints()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.view.addAutoSubviews([tableView])

        tableView.register(HomeExchangesHeaderTVCell.self)
        tableView.register(SectionHeaderView.self)
        tableView.register(ExchangesInfoTVCell.self)

        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .backgroundDark
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
        tableView.edgesToSuperview(usingSafeArea: true)
    }
    
    // MARK: AssetsViewInput
}

extension AssetsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: HomeExchangesHeaderTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure()
            return cell
        }
        let cell: ExchangesInfoTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure()
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView(frame: .zero)
        }
        let header: SectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.configure(title: "Assets Overview")
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
    }
}
