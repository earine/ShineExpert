//
//  Service.swift
//  ShineExpert
//
//  Created by Marina Lunts on 21.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit

class Service: NSObject {
    var title : String?
    var thumbnailImageView : String?
    var price : Int?

    init(title: String, thumbnailImageView: String, price: Int) {
        self.title = title
        self.thumbnailImageView = thumbnailImageView
        self.price = price
    }
}
