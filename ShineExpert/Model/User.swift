//
//  Driver.swift
//  ShineExpert
//
//  Created by Marina Lunts on 20.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit

class User: NSObject {
    var firstName : String?
    var lastName : String?
    
    var email : String?
    var phoneNumber : Int?
    
    var cars: [Car] = []
    
    var role: String?
    
    var rating : Double?
    var totalDays : Int?
    var totalIncome : Int?
    var todaysIncome : Int?
    var totalWashedCars : Int?
    var todaysWashedCars : Int?
    
    func setCar(cars: [Car]) {
        self.cars = [Car]()
        for c in cars {
            self.cars.append(Car(typeOfCar: c.typeOfCar, model: c.model, number: c.number, color: c.color))
        }
    }
}
