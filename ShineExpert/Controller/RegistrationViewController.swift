//
//  RegistrationViewController.swift
//  ShineExpert
//
//  Created by Marina Lunts on 9/26/18.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var telephoneTextField: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailTextField.addTarget(self, action: #selector(isInputCorrect), for: .editingChanged)
        
        telephoneTextField.addTarget(self, action: #selector(isInputCorrect), for: .editingChanged)

        //  self.telephoneTextField.addTarget(self, action: #selector(isEmailCorrect), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func isInputCorrect(textField: UITextField) {
        
        if let text = textField.text {
            if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
                switch (textField.restorationIdentifier) {
                case "email":
                    if (text.count < 3 || !text.contains("@")) {
                        floatingLabelTextField.errorMessage = "Неправильный email"
                    } else {
                        floatingLabelTextField.errorMessage = ""
                    }
                case "telephone":
                    if (text.count < 3 || !text.contains("+380")) {
                        floatingLabelTextField.errorMessage = "Неправильный номер"
                    } else {
                        floatingLabelTextField.errorMessage = ""
                    }
                default:
                    if (text.isEmpty) {
                        floatingLabelTextField.errorMessage = "Неверный ввод"
                    } else {
                        floatingLabelTextField.errorMessage = ""
                    }
                }
            }
        }
    }
        
        
        
        
        // убирается клавиатура при нажатии в любой точке экрана
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}
