//
//  AddExchangeViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

final class AddExchangeViewController: UIViewController, AddExchangeViewInput {

    // MARK: Properties
    var presenter: AddExchangeViewOutput!

    private var tfProfileName: AddExchangeTextFieldView = AddExchangeTextFieldView()

    private var tfAPIKey: AddExchangeTextFieldView = AddExchangeTextFieldView()

    private var tfAPISecret: AddExchangeTextFieldView = AddExchangeTextFieldView()

    private var switchImportWithdrawals: AddExchangeSwitchView = AddExchangeSwitchView()

    private var switchImportPastTransactions: AddExchangeSwitchView = AddExchangeSwitchView()

    private var switchImportPastTransactions2: AddExchangeSwitchView = AddExchangeSwitchView()

    private var messageLabel: UILabel = .label(text: Strings.AddExchangeScreen.message, color: .silver20, font: .sectionSubTitle, numOfLines: 0, alignment: .center)

    private var additionalOptionSectionLabel: UILabel = .label(text: "Additional Options", color: .silver20, font: .bodyMedium, numOfLines: 1)

    private var addExchangeBtn: UIButton = .button(
        title: "Add Exchange", color: .silver, font: .heading, backgroundColor: .warmBlue
    )

    private var topBarView: UIView = .view(background: .darkGreyBlue)

    private var apiSyncBtn: UIButton = .button(title: "API Sync", color: .silver, font: .buttonSmall, backgroundColor: .warmBlue) { (btn) in
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }

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
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.view.addAutoSubviews([topBarView, additionalOptionSectionLabel, messageLabel, addExchangeBtn])
        topBarView.addSubview(apiSyncBtn)

        tfProfileName.configure(placeholder: "Profile Name", text: "", actionBtnImage: nil)
        tfAPIKey.configure(placeholder: "API Key", text: "", actionBtnImage: Asset.icCamera.image)
        tfAPISecret.configure(placeholder: "API Secret", text: "", actionBtnImage: Asset.icCamera.image)

        switchImportWithdrawals.configure(text: "Import withdrawals/deposits", isOn: true)
        switchImportPastTransactions.configure(text: "Import past transactions", isOn: false)
        switchImportPastTransactions2.configure(text: "Import past transactions", isOn: false)

        switchImportPastTransactions2.isEnabled = false
        switchImportPastTransactions.onStateChanged { [weak self] (isOn) in
            guard let self = self else {
                return
            }
            if isOn {
                self.confirmPastTransactions()
            } else {
                self.switchImportPastTransactions2.isEnabled = false
            }
        }

        addExchangeBtn.addTarget(self, action: #selector(addExchangeBtnTapped), for: .touchUpInside)
    }

    @objc private func addExchangeBtnTapped() {
        let portfolioName = tfProfileName.textValue
        let apiKey = tfAPIKey.textValue
        let apiSecret = tfAPISecret.textValue
        let importDeposits = switchImportWithdrawals.isSwitchOn
        let importPastTransactions = switchImportPastTransactions.isSwitchOn

        let addExchange = AddExchange(
            profileName: portfolioName, apiKey: apiKey, apiSecret: apiSecret,
            importDeposits: importDeposits, importPastTransactions: importPastTransactions
        )

        self.presenter.addExchangePortfolio(exchange: addExchange)
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .background
        addExchangeBtn.contentEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() {
        topBarView.edgesToSuperview(excluding: .bottom)
        topBarView.height(36)

        apiSyncBtn.edgesToSuperview(excluding: .trailing)

        let profileDetailSV: UIStackView = .stackView(subviews: [tfProfileName, tfAPIKey, tfAPISecret], axis: .vertical, distribution: .fill, alignment: .fill, spacing: 10)

        self.view.addSubview(profileDetailSV)

        let additionalOptionsSV: UIStackView = .stackView(subviews: [switchImportWithdrawals, switchImportPastTransactions, switchImportPastTransactions2], axis: .vertical, distribution: .fill, alignment: .fill, spacing: 0)

        self.view.addSubview(additionalOptionsSV)

        profileDetailSV.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
        profileDetailSV.topToBottom(of: topBarView, offset: 20)

        additionalOptionSectionLabel.leadingToSuperview(offset: 24)
        additionalOptionSectionLabel.topToBottom(of: profileDetailSV, offset: 40)
        additionalOptionSectionLabel.trailingToSuperview(offset: 24)

        additionalOptionsSV.leadingToSuperview(offset: 12)
        additionalOptionsSV.topToBottom(of: additionalOptionSectionLabel, offset: 20)
        additionalOptionsSV.trailingToSuperview(offset: 12)

        messageLabel.leadingToSuperview(offset: 34)
        messageLabel.topToBottom(of: additionalOptionsSV, offset: 20)
        messageLabel.trailingToSuperview(offset: 34)

        addExchangeBtn.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }

    private func confirmPastTransactions() {
        let alert = OCBottomAlertController(title: "Import Past Transactions", message: "Please be aware that importing past transactions might heavily influence your current portfolio balances. Funds that are being used need to be accounted for.")

        alert.addAction(AlertAction(title: "Cancel", style: .cancel, handler: { [weak self] (_) in
            self?.switchImportPastTransactions.isSwitchOn = false
        }))

        alert.addAction(AlertAction(title: "Confirm", style: .default, handler: { [weak self] (_) in
            self?.switchImportPastTransactions2.isEnabled = true
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: AddExchangeViewInput
    func setNavigationTitle(exchange: Exchange) {
        setNavigation(barType: .exchange(exchange: exchange))
    }
}
