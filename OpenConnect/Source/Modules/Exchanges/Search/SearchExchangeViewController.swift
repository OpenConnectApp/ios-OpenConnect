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

    private var exchanges: [Exchange] = [
        Exchange(title: "CoinDCX", image: Asset.icExchangeCoindcx.image),
        Exchange(title: "Binance", image: Asset.icExchangeBinance.image),
        Exchange(title: "Delta.Exchange", image: Asset.icExchangeDelta.image),
        Exchange(title: "Deribit", image: Asset.icExhangeDeribit.image),
        Exchange(title: "Kraken", image: Asset.appLogo.image),
        Exchange(title: "Bitfinex", image: Asset.appLogo.image),
        Exchange(title: "CEX.io", image: Asset.appLogo.image),
        Exchange(title: "Coinbase", image: Asset.appLogo.image),
        Exchange(title: "Kucoin", image: Asset.appLogo.image),
        Exchange(title: "BitMex", image: Asset.appLogo.image),
        Exchange(title: "BitBNS", image: Asset.appLogo.image)
    ]

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

        tableView.edgesToSuperview(excluding: .top)
        tableView.topToBottom(of: searchBar, offset: 12)
    }
    
    @objc private func closeNavBtnTapped() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: SearchExchangeViewInput
}

extension SearchExchangeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchanges.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SelectExchangeTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(exchange: exchanges[indexPath.row], indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.addNewExchange(at: exchanges[indexPath.row])
    }
}

extension SearchExchangeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
