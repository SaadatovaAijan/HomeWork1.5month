//
//  RegistrationView.swift
//  HomeWork1.5month
//
//  Created by Aijan Saadatova on 17/6/24.
//

import UIKit
protocol RegistrationViewProtocol: AnyObject {
    func nextButton()
    func alert()
}

class RegistrationView: UIViewController {
    
    private var controller: RegistrationControllerProtocol?
    
    private let loginLable: UILabel = {
        let view = UILabel()
        view.text = "Login"
        view.font = .systemFont(ofSize: 12, weight: .light)
        view.textColor = .black
        return view
    }()
    
     let loginTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите логин"
        tf.layer.cornerRadius = 16
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 0.5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        tf.leftView = view
        tf.leftViewMode = .always
         tf.addTarget(self, action: #selector(showNextView), for: .valueChanged)

        return tf
    }()
    
     let passwordLable: UILabel = {
        let lbl = UILabel()
        lbl.text = "Password"
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .black
        return lbl
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "Введите пароль"
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 15
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 5))
        tf.leftView = view
        tf.leftViewMode = .always
        
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 20))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tintColor = .black
        tf.rightView = rightView
        tf.addTarget(self, action: #selector(showNextView), for: .valueChanged)

        tf.rightViewMode = .always
        return tf
    }()
    
    private lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .systemCyan
        btn.setTitle("Next", for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 22
        btn.addTarget(self, action: #selector(showNextView), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        controller = RegistrationController(view: self)
        view.backgroundColor = .systemBackground
    }

    private func setupUI() {
        view.addSubview(loginLable)
        loginLable.translatesAutoresizingMaskIntoConstraints = false
        loginLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        loginLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        loginLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        view.addSubview(loginTF)
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        loginTF.topAnchor.constraint(equalTo: loginLable.bottomAnchor, constant: 10).isActive = true
        loginTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        loginTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        loginTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(passwordLable)
        passwordLable.translatesAutoresizingMaskIntoConstraints = false
        passwordLable.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 20).isActive = true
        passwordLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        view.addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: passwordLable.bottomAnchor, constant: 10).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 180).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func showNextView() {
        controller?.showNextView(sender: nextBtn, login: loginTF, password: passwordTF)
    }
}

extension RegistrationView: RegistrationViewProtocol {
    func alert() {
        let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль не совпадают. Пожалуйста, введите корректные данные.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func nextButton() {
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
