//
//  FirstViewController.swift
//  HW2 TabBarController and UINavigationViewController
//
//  Created by Iryna Mishyna on 20.09.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let NextButtonSecondNextVC = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.addSubview(NextButtonSecondNextVC)
        view.backgroundColor = .white
        
        navigationItem.title = "Two step"
        
        NextButtonSecondNextVC.setTitle("Next", for: .normal)
        NextButtonSecondNextVC.addTarget(self, action: #selector(actionForSecondNextDisplay), for: .touchUpInside)
    }
    
    private func setUpAutoLayout() {
        NextButtonSecondNextVC.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NextButtonSecondNextVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NextButtonSecondNextVC.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func actionForSecondNextDisplay() {
        let secondNextVC = NextViewController()
        secondNextVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(secondNextVC, animated: true)
    }
}
