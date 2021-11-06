//
//  ViewController.swift
//  HW2 TabBarController and UINavigationViewController
//
//  Created by Iryna Mishyna on 20.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var loginButton: UIButton = {
        var loginButton = UIButton(frame: .zero)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .gray
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        return loginButton
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.backgroundColor = .white
        view.addSubview(loginButton)
    }
    
    private func setUpAutoLayout() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func didTabButton() {
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: SecondViewController())
        let vc2 = UINavigationController(rootViewController: FirstViewController())
        
        vc1.title = "Next"
        vc1.tabBarItem.image = UIImage(systemName: "chevron.right.circle.fill")
        
        vc2.title = "Home"
        vc2.tabBarItem.image = UIImage(systemName: "house")
       
        tabBarVC.setViewControllers([vc1, vc2], animated: false)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

