//
//  RegistrationModel.swift
//  HomeWork1.5month
//
//  Created by Aijan Saadatova on 17/6/24.
//

import UIKit
protocol RegistrationModelProtocol: AnyObject {
    func validBtnTapped(login: UITextField, password: UITextField)
}

class RegistrationModel {
    var controller: RegistrationControllerProtocol?
    
    
    
    init(controller: RegistrationControllerProtocol) {
        self.controller = controller
    }
}

extension RegistrationModel: RegistrationModelProtocol {

    func validBtnTapped(login: UITextField, password: UITextField) {
         if login.text == "Aijan", password.text == "12345" {
             controller?.nextScreen()
        } else {
            controller?.alert()
        }
    }
}
