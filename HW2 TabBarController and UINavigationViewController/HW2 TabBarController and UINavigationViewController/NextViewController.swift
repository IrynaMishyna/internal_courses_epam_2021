//
//  NextViewController.swift
//  HW2 TabBarController and UINavigationViewController
//
//  Created by Iryna Mishyna on 30.09.2021.
//

import UIKit

class NextViewController: UIViewController {
    
    private let NextButtonToSecondNextViewController = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.addSubview(NextButtonToSecondNextViewController)
        view.backgroundColor = .white
        
        navigationItem.title = "SecondNextViewController step"
        
        NextButtonToSecondNextViewController.setTitle("Next", for: .normal)
        NextButtonToSecondNextViewController.addTarget(self, action: #selector(actionForSecondThirdViewController), for: .touchUpInside)
    }
    
    private func setUpAutoLayout() {
        NextButtonToSecondNextViewController.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NextButtonToSecondNextViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NextButtonToSecondNextViewController.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func actionForSecondThirdViewController() {
        let NextVC = ThirdViewController()
        NextVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(NextVC, animated: true)
    }
}
