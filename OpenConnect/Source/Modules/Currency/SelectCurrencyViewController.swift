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
    
    // MARK: SelectCurrencyViewInput
}
