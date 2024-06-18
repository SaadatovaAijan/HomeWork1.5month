//
//  MainViewController.swift
//  HomeWork1.5month
//
//  Created by Aijan Saadatova on 17/6/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let welcomLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Добро пожаловать!"
        lbl.font = .systemFont(ofSize: 25, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(welcomLabel)
        NSLayoutConstraint.activate([
        welcomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        welcomLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
