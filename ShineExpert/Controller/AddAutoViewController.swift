//
//  AddAutoViewController.swift
//  ShineExpert
//
//  Created by Marina Lunts on 9/27/18.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField


class AddAutoViewController: UIViewController {

    var thisUser = User()

    
    @IBOutlet weak var typeOfCarTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var modelCarTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var numberCarTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var colorCarTextField: SkyFloatingLabelTextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //typeCarTextField.isTitleVisible(true)
      //  typeCarTextField.is

    }
    
    @IBAction func addAutoButton(_ sender: Any) {
        let newOrderMap = NewOrderMapViewController()
        let car = Car(typeOfCar: (typeOfCarTextField.text)!, model: (modelCarTextField.text)!, number: (numberCarTextField.text)!, color: (colorCarTextField.text)!)
       thisUser.setCar(cars: [car])
        
      user.cars.append(car)
        //print(thisUser.cars[0].model)
        
       //navigationController?.pushViewController(newOrderMap, animated: true)
        self.performSegue(withIdentifier: "goToMap", sender: self)
    }
    
    
    // убирается клавиатура при нажатии в любой точке экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
