//
//  SearchExchangeViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class SearchExchangeViewController: UIViewController, SearchExchangeViewInput {

    // MARK: Properties
    var presenter: SearchExchangeViewOutput!

    private var tableView: UITableView = .tableview()

    private var viewModel: SearchExchangeViewModel?

    private var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search for exchange"
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

    private lazy var closeBarBtn: UIBarButtonItem = .init(image: Asset.icNavClose.image, style: .plain, target: self, action: #selector(closeNavBtnTapped))
    
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
        setNavTitle(title: Strings.NavigationTitle.selectExchange)
        setupViews()
        themeViews()
        setupConstraints()
        self.presenter.viewDidLoad()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.view.addAutoSubviews([searchBar, tableView])

        tableView.register(SelectExchangeTVCell.self)

        tableView.delegate = self
        tableView.dataSource = self

        searchBar.delegate = self

        self.navigationItem.rightBarButtonItem = closeBarBtn
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .backgroundDark
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() {
        searchBar.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24))
        searchBar.height(44)

        tableView.edgesToSuperview(excluding: .top, usingSafeArea: true)
        tableView.topToBottom(of: searchBar, offset: 12)
    }
    
    @objc private func closeNavBtnTapped() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: SearchExchangeViewInput
    func showExchanges(viewModel: SearchExchangeViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

extension SearchExchangeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = self.viewModel else {
            return 0
        }
        return model.exchanges.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.viewModel else {
            fatalError("ViewModel Not Configured")
        }

        let cell: SelectExchangeTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(exchange: model.exchanges[indexPath.row], indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.exchangeSelected(at: indexPath)
    }
}

extension SearchExchangeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
