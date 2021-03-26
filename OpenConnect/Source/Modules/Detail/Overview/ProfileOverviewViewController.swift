//
//  ProfileOverviewViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ProfileOverviewViewController: UIViewController, ProfileOverviewViewInput {

    // MARK: Properties
    var presenter: ProfileOverviewViewOutput!

    private var tableView: UITableView = .tableview()

    private var assets: [Exchange] = [
        Exchange(title: "Bitcoin", image: Asset.icExchangeCoindcx.image),
        Exchange(title: "Litecoin", image: Asset.icExchangeBinance.image),
        Exchange(title: "Deribit", image: Asset.icExhangeDeribit.image),
        Exchange(title: "Kraken", image: Asset.icExchangeDelta.image),
        Exchange(title: "Bitfinex", image: Asset.appLogo.image),
        Exchange(title: "CEX.io", image: Asset.appLogo.image),
        Exchange(title: "Coinbase", image: Asset.appLogo.image),
        Exchange(title: "Kucoin", image: Asset.appLogo.image),
        Exchange(title: "BitMex", image: Asset.appLogo.image),
        Exchange(title: "BitBNS", image: Asset.appLogo.image)
    ]

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
    
    // MARK: ProfileOverviewViewInput
}

extension ProfileOverviewViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return assets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: HomeExchangesHeaderTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(chartType: .line)
            return cell
        }
        let cell: ExchangesInfoTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(exchange: assets[indexPath.row])
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
}
