//
//  SettingsViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 16/05/21.
//  
//

import Foundation
import UIKit

enum SettingMenu {
    case profile
    case rewards
    case appSettings
    case notifications
    case security
    case support
    case rateAndReview
    case footer
    case header

    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .rewards:
            return "Rewards"
        case .appSettings:
            return "App Settings"
        case .notifications:
            return "Notifications"
        case .security:
            return "Security"
        case .support:
            return "Support"
        case .rateAndReview:
            return "Rate and Review"
        default:
            return ""
        }
    }

    var icon: UIImage {
        switch self {
        case .profile:
            return Asset.icNavProfile.image
        case .rewards:
            return Asset.icNavRewards.image
        case .appSettings:
            return Asset.icNavAppSettings.image
        case .notifications:
            return Asset.icNavNotifications.image
        case .security:
            return Asset.icNavSecurity.image
        case .support:
            return Asset.icNavSupport.image
        case .rateAndReview:
            return Asset.icNavRateAndReview.image
        default:
            return Asset.appLogo.image
        }
    }
}

final class SettingsViewController: UIViewController, SettingsViewInput {

    // MARK: Properties
    var presenter: SettingsViewOutput!

    private var menu: [SettingMenu] = [.header, .profile, .rewards, .appSettings, .notifications, .security, .support, .rateAndReview, .footer]

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
        setNavTitle(title: Strings.NavigationTitle.settings)
        setupViews()
        themeViews()
        setupConstraints()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.view.addAutoSubview(tableView)

        tableView.register(SettingMenuTVCell.self)
        tableView.register(SettingMenuFooterTVCell.self)
        tableView.register(SettingMenuHeaderTVCell.self)

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
        tableView.edgesToSuperview()
    }
    
    // MARK: SettingsViewInput
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch menu[indexPath.row] {
        case .footer:
            let cell: SettingMenuFooterTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure()
            return cell
        case .header:
            let cell: SettingMenuHeaderTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure()
            return cell
        default:
            let cell: SettingMenuTVCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(menu: menu[indexPath.row])
            return cell
        }
    }
}
