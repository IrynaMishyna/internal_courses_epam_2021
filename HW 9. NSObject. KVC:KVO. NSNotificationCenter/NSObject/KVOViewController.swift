//
//  KVOViewController.swift
//  NSObject
//
//  Created by Iryna Mishyna on 25.11.2021.
//

//• Create a view controller with a couple of views or labels.
//Create a model with some counter and a timer to increment this number each second.
//Observe this counter from a view controller to update a label on a screen. Use KVO. • Repeat the same with NSNotificationCenter.

import Foundation
import UIKit

class KVOViewController: UIViewController {
    
    lazy var firstLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemGray6
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "NCenter 0"
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemGray6
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Observation 0"
        return label
    }()
    
    
    var nameObservation: NSKeyValueObservation?
    
    var model: Model = Model()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setUpSubviews()
        setUpAutoLayout()
        
        
        nameObservation = model.observe(\.counter, options: [.new], changeHandler: { model, change in
            guard let updatedName = change.newValue else { return }
            
            self.secondLabel.text = "Observation \(updatedName)"
        })
        
        addObservers()
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: Model.Constant.counter, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        
        //зачем нужен нил
        nameObservation = nil
    }
    
    //MARK: - set up
    
    private func setUpSubviews() {
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        
    }
    
    private func setUpAutoLayout() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor),
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
    
    @objc func handleNotification(notif: Notification) {
        
        guard let value = notif.userInfo?["counter"] as? Int else {
            firstLabel.text = "\(model.counter)"
            return
        }
        firstLabel.text = "NCenter \(value)"
    }
}

//MARK: - class Model

class Model: NSObject {
    
    enum Constant {
        static let counter = Notification.Name(rawValue: "Counter")
    }
    
    var timer = Timer()
    
    @objc dynamic var counter: Int = 0
    
    
    override init() {
        super.init()
        
        setupTimer()
    }
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(incrementCounter), userInfo: nil, repeats: true)
    }
       
    deinit {
        timer.invalidate()
    }
    
    @objc func incrementCounter() {
        counter += 1
        NotificationCenter.default.post(name: Constant.counter, object: nil, userInfo: ["counter": counter])
    }
}
