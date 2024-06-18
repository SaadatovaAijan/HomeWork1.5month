//
//  RegistrationController.swift
//  HomeWork1.5month
//
//  Created by Aijan Saadatova on 17/6/24.
//

import UIKit
protocol RegistrationControllerProtocol: AnyObject {
    
    func showNextView(sender: UIButton, login: UITextField, password: UITextField)
    func alert()
    func nextScreen()
}

class RegistrationController {
    var view: RegistrationViewProtocol?
    var model: RegistrationModelProtocol?
    
    init(view: RegistrationViewProtocol) {
        self.view = view
        self.model = RegistrationModel(controller: self)
    }
}

extension RegistrationController: RegistrationControllerProtocol {
    func alert() {
        view?.alert()
    }
    
    func showNextView(sender: UIButton, login: UITextField, password: UITextField) {
        model?.validBtnTapped(login: login, password: password)
    }
    
    func nextScreen() {
        view?.nextButton()
    }
}
