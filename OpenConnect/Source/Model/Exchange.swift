//
//  Exchange.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

struct Exchange {
    var title: String
    var image: UIImage?

    init(data: PublicDataService_ExchangeData) {
        title = data.name
        image = nil
    }
}
