//
//  SelectExchangeViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class SelectExchangeViewController: UIViewController, SelectExchangeViewInput {

    // MARK: Properties
    var presenter: SelectExchangeViewOutput!

    private var contentView: UIView = .view(background: .darkGreyBlue)

    private var tableView: UITableView = .tableview(bounces: false)

    private var addExchangeBtn: UIButton = .button(
        title: "Add Exchange", color: .silver, font: .heading, backgroundColor: .warmBlue
    )

    private var titleLabel: UILabel = .label(
        text: "Select Exchange", color: .silver40, font: .sectionBigTitle
    )

    private var closeBtn: UIButton = .button(type: .custom)

    private var tableViewHeightConstraint: NSLayoutConstraint?

    private var tableViewCellHeight: CGFloat = 52

    private var viewModel: SelectExchangeViewModel?

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
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateShow()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.contentView.roundCorners(corners: [.topLeft, .topRight], radius: 32)
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        contentView.addAutoSubviews([titleLabel, closeBtn, tableView, addExchangeBtn])
        self.view.addAutoSubview(contentView)

        tableView.register(SelectExchangeTVCell.self)

        tableView.delegate = self
        tableView.dataSource = self

        closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)

        addExchangeBtn.addTarget(self, action: #selector(addExchangeBtnTapped), for: .touchUpInside)
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = UIColor(hexString: "#25294a").withAlphaComponent(0.7)

        closeBtn.setImageForAllStates(Asset.icNavClose.image)
        addExchangeBtn.contentEdgeInsets = UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() {
        contentView.edgesToSuperview(excluding: .top)

        titleLabel.topToSuperview(offset: 24)
        titleLabel.leadingToSuperview(offset: 24)
        titleLabel.trailingToLeading(of: closeBtn, offset: -12)

        closeBtn.width(28)
        closeBtn.aspectRatio(1)
        closeBtn.trailingToSuperview(offset: 24)
        closeBtn.centerY(to: titleLabel)

        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.topToBottom(of: titleLabel, offset: 20)
        tableView.bottomToTop(of: addExchangeBtn, offset: -10)
        tableViewHeightConstraint = tableView.height(tableViewCellHeight * CGFloat(self.viewModel?.exchanges.count ?? 5))

        addExchangeBtn.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }

    @objc private func closeBtnTapped() {
        animateHide {
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func animateShow() {
        self.contentView.layoutIfNeeded()
        let height = self.contentView.frame.height
        self.contentView.transform = CGAffineTransform(translationX: 0, y: height)
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.contentView.transform = CGAffineTransform.identity
            self.contentView.layoutIfNeeded()
        }, completion: nil)
    }

    private func animateHide(completion: @escaping (() -> Void)) {
        contentView.layoutIfNeeded()
        let height = self.contentView.frame.height
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.contentView.transform = CGAffineTransform(translationX: 0, y: height)
        }, completion: { (completed) in
            completion()
        })
    }

    @objc private func addExchangeBtnTapped() {
        self.presenter.addNewExchange()
    }
    
    // MARK: SelectExchangeViewInput
    func dismissScreen(completion: @escaping () -> Void) {
        self.dismiss(animated: true, completion: completion)
    }

    func showExchanges(viewModel: SelectExchangeViewModel) {
        self.viewModel = viewModel
        let count = viewModel.exchanges.count
        tableViewHeightConstraint?.constant = tableViewCellHeight * CGFloat(count > 5 ? 5 : count)
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        tableView.reloadData()
    }
}

extension SelectExchangeViewController: UITableViewDelegate, UITableViewDataSource {

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
            fatalError("ViewModel not configured")
        }
        let cell: SelectExchangeTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(exchange: model.exchanges[indexPath.row], indexPath: indexPath, isSelected: indexPath.row == model.selectedIndex)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.exchangeSelected(at: indexPath)
    }
}
