//
//  SecondViewController.swift
//  HW2 TabBarController and UINavigationViewController
//
//  Created by Iryna Mishyna on 20.09.2021.
//

import UIKit

class FirstViewController: UIViewController {

    private let loginButtonSecondVC = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.addSubview(loginButtonSecondVC)
        view.backgroundColor = .white
        
        navigationItem.title = "Logout"
        
        loginButtonSecondVC.setTitle("Logout", for: .normal)
        loginButtonSecondVC.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private func setUpAutoLayout() {
        loginButtonSecondVC.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButtonSecondVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButtonSecondVC.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func goBack() {
        dismiss(animated: true)
    }
}
