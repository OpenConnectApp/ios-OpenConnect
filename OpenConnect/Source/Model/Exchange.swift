//
//  Exchange.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

struct Exchange {
    var id: String = "-1"
    var title: String
    var image: UIImage?
    var enabled: Bool = false
    var imageUrl: String?

    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }

    init(data: PublicDataService_ExchangeData) {
        id = data.exchangeID
        title = data.name
        enabled = data.enabled
        image = nil
        imageUrl = data.iconURL
    }
}
