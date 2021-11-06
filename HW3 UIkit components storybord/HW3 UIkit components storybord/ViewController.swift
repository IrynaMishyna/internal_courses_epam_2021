//
//  ViewController.swift
//  HW3 UIkit components storybord
//
//  Created by Iryna Mishyna on 22.09.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let button = UIButton()
    private var cardTextField = CustomTextField(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cardTextField)
        view.addSubview(button)  //for test func textFieldDidEndEditing

        setUpAutoLayout()
        setUpSubviews()
        
        button.setTitle("End editing", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setUpSubviews() {
        
        let button = UIButton(type: .contactAdd, primaryAction: nil)
        
        cardTextField.addLeftControl(button)
    }
    
    private func setUpAutoLayout() {
        cardTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cardTextField.heightAnchor.constraint(equalToConstant: 70),
            cardTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 70),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90)
        ])
    }
    
    @objc
    private func buttonTapped() {
        
        view.endEditing(true)
    }
}



