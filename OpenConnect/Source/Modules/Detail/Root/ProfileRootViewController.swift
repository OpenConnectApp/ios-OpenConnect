//
//  ProfileRootViewController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit
import Tabman
import Pageboy

final class ProfileRootViewController: TabmanViewController, ProfileRootViewInput {

    // MARK: Properties
    var presenter: ProfileRootViewOutput!

    private var tabViewControllers: [UIViewController] = []

    private var tabTitles: [String] = []

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
    }
    
    //Apply Theming for views here
    private func themeViews() {
        self.view.backgroundColor = .background
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
    }
    
    // MARK: ProfileRootViewInput
    func setNavigationTitle(exchange: Exchange) {
        setNavigation(barType: .exchange(exchange: exchange))
    }

    func displayTabs(viewControllers: [UIViewController], titles: [String]) {
        tabViewControllers.removeAll()
        tabViewControllers.append(contentsOf: viewControllers)
        self.tabTitles.removeAll()
        self.tabTitles.append(contentsOf: titles)
        self.reloadData()
    }
}

extension ProfileRootViewController: PageboyViewControllerDataSource, TMBarDataSource {

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
