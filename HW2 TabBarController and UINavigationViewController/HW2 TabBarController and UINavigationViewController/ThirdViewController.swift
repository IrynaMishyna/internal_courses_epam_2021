//
//  ThirdViewController.swift
//  HW2 TabBarController and UINavigationViewController
//
//  Created by Iryna Mishyna on 20.09.2021.
//

import UIKit

class ThirdViewController: UIViewController {

    private let goHomeVCButton = UIButton(type: .system)
    private let detailsButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        
        view.addSubview(goHomeVCButton)
        view.addSubview(detailsButton)
        
        navigationItem.title = "Last"

        goHomeVCButton.setTitle("GO HOME", for: .normal)
        goHomeVCButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        detailsButton.setTitle("Details", for: .normal)
        detailsButton.addTarget(self, action: #selector(actionForDismiss), for: .touchUpInside)

    }
    
    private func setUpAutoLayout() {
        goHomeVCButton.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goHomeVCButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            goHomeVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goHomeVCButton.heightAnchor.constraint(equalToConstant: 60),
            goHomeVCButton.widthAnchor.constraint(equalToConstant: 60),

            detailsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            detailsButton.centerYAnchor.constraint(equalTo: goHomeVCButton.centerYAnchor),

            detailsButton.leftAnchor.constraint(equalTo: goHomeVCButton.rightAnchor, constant: 10),
            detailsButton.heightAnchor.constraint(equalTo: goHomeVCButton.heightAnchor),
            detailsButton.widthAnchor.constraint(equalTo: goHomeVCButton.widthAnchor)
            ])
    }
    
    @objc private func goBack() {
        navigationController?.popToRootViewController(animated: false)
    }
    
        @objc private func actionForDismiss() {
            let detailVC = DetailsViewController()
            
            detailVC.modalPresentationStyle = .formSheet
            present(detailVC, animated: true)

        }
}


