//
//  HomeViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit
import Tabman
import Pageboy

final class HomeViewController: TabmanViewController, HomeViewInput {

    // MARK: Properties
    var presenter: HomeViewOutput!

    private var tabViewControllers: [UIViewController] = [
        ExchangesModuleBuilder.buildModule(dependency: (), payload: ()),
        AssetsModuleBuilder.buildModule(dependency: (), payload: ())
    ]

    private var tabTitles: [String] = ["Exchanges", "Assets"]

    private lazy var hamburgerBarBtn: UIBarButtonItem = .init(image: Asset.icNavHamburger.image, style: .plain, target: self, action: #selector(hamburgerNavBtnTapped))

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
        setNavigation(barType: .openconnect)
        setupViews()
        themeViews()
        setupConstraints()
    }
    
    // MARK: Private Methods
    
    //Configure Views and subviews
    private func setupViews() {
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .flat(color: .darkGreyBlue)
        bar.layout.transitionStyle = .snap
        bar.indicator.weight = .custom(value: 0)

        bar.buttons.customize { (button) in
            button.tintColor = .silver20
            button.selectedTintColor = .silver
            button.font = .sectionSubTitle
            button.contentInset = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        }

        // Add to view
        addBar(bar, dataSource: self, at: .top)

        self.navigationItem.rightBarButtonItem = hamburgerBarBtn
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .background
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
    }

    @objc private func hamburgerNavBtnTapped() {
    }
    
    // MARK: HomeViewInput
}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return tabViewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return tabViewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        return TMBarItem(title: tabTitles[index])
    }
}
