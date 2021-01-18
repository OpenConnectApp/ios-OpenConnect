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

        tableView.register(TransactionTVCell.self)

        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .backgroundDark

        tableView.separatorColor = UIColor.warmBlue.withAlphaComponent(0.4)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
        tableView.edgesToSuperview(usingSafeArea: true)
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
