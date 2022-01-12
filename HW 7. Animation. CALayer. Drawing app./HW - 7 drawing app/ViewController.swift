//
//  ViewController.swift
//  HW - 7 drawing app
//
//  Created by Iryna Mishyna on 30.10.2021.
//

import UIKit

class ViewController: UIViewController {

    let canvas = Canvas()
//    var stackView = UIStackView()
//
//
//    let undoButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Undo", for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
//        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
//        return button
//    }()
//
//    @objc fileprivate func handleUndo() {
//        canvas.undo()
//    }

//    let happyButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("happyButton", for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
//        button.addTarget(self, action: #selector(clearAll), for: .touchUpInside)
//
//        return button
//    }()
    
    @objc fileprivate func clearAll() {
        canvas.clear()
    }
    
    private lazy var longPress: UILongPressGestureRecognizer = {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(clearAll))
        longPress.minimumPressDuration = 1.0
        return longPress
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        stackView = UIStackView(arrangedSubviews: [undoButton, happyButton])

        setUpSubviews()
        setUpAutoLayout()
          
    }
    
    func setUpSubviews() {
        
        view.addSubview(canvas)
//        view.addSubview(stackView)
        view.addGestureRecognizer(longPress)
        
        canvas.backgroundColor = .white
    }
    
    func setUpAutoLayout() {
        canvas.frame = view.frame
        
//        stackView.distribution = .fillEqually
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            ])
    }
}

