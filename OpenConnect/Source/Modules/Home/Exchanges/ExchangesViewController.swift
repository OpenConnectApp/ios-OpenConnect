//
//  ExchangesViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ExchangesViewController: UIViewController, ExchangesViewInput {

    // MARK: Properties
    var presenter: ExchangesViewOutput!

    private var tableView: UITableView = .tableview()

    private var viewModel: ExchangesViewModel?
    
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
        setNavTitle(title: nil)
        setupViews()
        themeViews()
        setupConstraints()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
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
        self.view.backgroundColor = .background
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
        tableView.edgesToSuperview(usingSafeArea: true)
    }
    
    // MARK: ExchangesViewInput
    func showExchanges(viewModel: ExchangesViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension ExchangesViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = self.viewModel else {
            return 0
        }
        if section == 0 {
            return 1
        }
        return model.exchanges.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.viewModel else {
            fatalError("ViewModel not configure")
        }
        if indexPath.section == 0 {
            let cell: HomeExchangesHeaderTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(chartType: .pie)
            return cell
        }
        let cell: ExchangesInfoTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(exchange: model.exchanges[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView(frame: .zero)
        }
        let header: SectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.configure(title: "Exchanges Overview")
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
        self.presenter.exchangeSelected(at: indexPath)
    }
}
