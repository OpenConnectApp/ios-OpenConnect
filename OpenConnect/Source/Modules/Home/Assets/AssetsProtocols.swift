//
//  AssetsProtocols.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol AssetsViewInput: AnyObject {
    // TO-DO: Declare ViewInput methods
}

// MARK: Presenter
protocol AssetsViewOutput: AnyObject {
    func assetSelected(at: IndexPath)
}

protocol AssetsModuleInput: AnyObject {
    // MARK: Presenter Variables
    var view: AssetsViewInput? { get set }
    var interactor: AssetsInteractorInput! { get set }
    var router: AssetsRouterInput! { get set }
}

protocol AssetsInteractorOutput: AnyObject {
    // TO-DO: Declare interactor output methods
}

// MARK: Interactor
protocol AssetsInteractorInput: AnyObject {
    // TO-DO: Declare interactor methods
}

// MARK: Router
protocol AssetsRouterInput: AnyObject {
    func showAssetDetail()
}
