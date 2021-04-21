//
//  Currency.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

struct Currency {
    var id: String = "-1"
    var name: String
    var enabled: Bool = false
    var value: Float = 0
    var baseCurrency: String = ""
    var symbol: String
    var image: UIImage?

    init(name: String, symbol: String, image: UIImage) {
        self.name = name
        self.symbol = symbol
        self.image = image
    }

    init(data: PublicDataService_CurrencyData) {
        id = data.currencyID
        name = data.name
        enabled = data.enabled
        value = data.value
        baseCurrency = data.baseCurrency
        symbol = ""
    }
}
