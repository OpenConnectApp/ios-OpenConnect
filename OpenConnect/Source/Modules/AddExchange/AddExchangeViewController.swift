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
    }
    
    //Apply Theming for views here
    private func themeViews() {
    }
    
    //Apply AutoLayout Constraints
    private func setupConstraints() { 
    }
    
    // MARK: AddExchangeViewInput
}
