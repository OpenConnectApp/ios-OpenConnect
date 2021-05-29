//
//  SelectCurrencyViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class SelectCurrencyViewController: UIViewController, SelectCurrencyViewInput {

    // MARK: Properties
    var presenter: SelectCurrencyViewOutput!

    private var tableView: UITableView = .tableview()

    private var viewModel: SelectCurrencyViewModel?

    private var currencys: [Currency] = [
        Currency(name: "United States Dollar", symbol: "USD", image: Asset.appLogo.image),
        Currency(name: "Euro", symbol: "EUR", image: Asset.icExchangeCoindcx.image),
        Currency(name: "Albanian Lek", symbol: "ALL", image: Asset.icExchangeBinance.image),
        Currency(name: "Guatemalan Quetzel", symbol: "GLZ", image: Asset.icExchangeDelta.image),
        Currency(name: "South Sudanese Pound", symbol: "SSP", image: Asset.icExhangeDeribit.image),
        Currency(name: "Algerian Diner", symbol: "DZD", image: Asset.appLogo.image),
        Currency(name: "Argentine Peso", symbol: "APS", image: Asset.appLogo.image),
        Currency(name: "Indian Rupee", symbol: "INR", image: Asset.appLogo.image),
        Currency(name: "Renminbi", symbol: "CNY", image: Asset.appLogo.image),
        Currency(name: "Danish Kron", symbol: "DKK", image: Asset.appLogo.image),
        Currency(name: "United States Dollar", symbol: "USD", image: Asset.appLogo.image),
        Currency(name: "Euro", symbol: "EUR", image: Asset.icExchangeCoindcx.image),
        Currency(name: "Albanian Lek", symbol: "ALL", image: Asset.icExchangeBinance.image),
        Currency(name: "Guatemalan Quetzel", symbol: "GLZ", image: Asset.icExchangeDelta.image)
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
        setNavTitle(title: Strings.NavigationTitle.selectCurrency)
        setupViews()
        themeViews()
        setupConstraints()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.view.addAutoSubviews([tableView])

        tableView.register(CurrencyTVCell.self)
        tableView.register(SectionSearchBarHeaderView.self)

        tableView.delegate = self
        tableView.dataSource = self

        self.navigationItem.rightBarButtonItem = closeBarBtn
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .backgroundDark
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() {
        tableView.edgesToSuperview(usingSafeArea: true)
    }

    @objc private func closeNavBtnTapped() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    // MARK: SelectCurrencyViewInput
    func showCurrencies(viewModel: SelectCurrencyViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

extension SelectCurrencyViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return currencys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: CurrencyTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(currency: currencys[indexPath.row], indexPath: indexPath, isSelected: true)
            return cell
        }
        let cell: CurrencyTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(currency: currencys[indexPath.row], indexPath: indexPath, isSelected: false)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.currencySelected(at: indexPath)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let header: SectionSearchBarHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.configure(placeholder: "Search for currency", text: "")
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return UITableView.automaticDimension
    }
}
