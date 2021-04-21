//
//  ProfileTransactionsViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class ProfileTransactionsViewController: UIViewController, ProfileTransactionsViewInput {

    // MARK: Properties
    var presenter: ProfileTransactionsViewOutput!

    private var tableView: UITableView = .tableview()

    private let filterCollectionView: UICollectionView = .collectionview(scrollDirection: .horizontal)

    private let transactionFilters: [String] = [
        "Buy", "Sell", "Deposit", "Withdrawal", "More", "Buy", "Sell", "Deposit", "Withdrawal", "More"
    ]

    private var filterSelectedIndex: Int = -1
    
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
        presenter.viewDidLoad()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.view.addAutoSubviews([filterCollectionView, tableView])

        tableView.register(TransactionTVCell.self)

        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        tableView.delegate = self
        tableView.dataSource = self

        filterCollectionView.register(TransactionFilterCVCell.self)

        if let layout = filterCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 52, height: 32)
            layout.itemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }

        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .background

        tableView.separatorColor = UIColor.warmBlue.withAlphaComponent(0.4)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() {
        filterCollectionView.edgesToSuperview(
            excluding: .bottom,
            insets: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0),
            usingSafeArea: true
        )
        filterCollectionView.height(40)

        tableView.topToBottom(of: filterCollectionView, offset: 4)
        tableView.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }
    
    // MARK: ProfileTransactionsViewInput
}

extension ProfileTransactionsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TransactionTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(indexPath: indexPath)
        return cell
    }
}

extension ProfileTransactionsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactionFilters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TransactionFilterCVCell = collectionView.dequeueReusableCell(for: indexPath)
        let item = transactionFilters[indexPath.row]
        cell.configure(title: item, indexPath: indexPath, isSelected: indexPath.row == filterSelectedIndex)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterSelectedIndex = indexPath.row
        let offset = collectionView.contentOffset
        collectionView.reloadData()
        collectionView.contentOffset = offset
    }
}
