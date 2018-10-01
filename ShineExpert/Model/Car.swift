//
//  Car.swift
//  ShineExpert
//
//  Created by Marina Lunts on 20.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit

class Car: NSObject {
    var typeOfCar : String
    var model : String
    var number : String
    var color : String

    init(typeOfCar: String, model: String, number: String, color: String) {
        self.typeOfCar = typeOfCar
        self.model = model
        self.number = number
        self.color = color
    }
}

