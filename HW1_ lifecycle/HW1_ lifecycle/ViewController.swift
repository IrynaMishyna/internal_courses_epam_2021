//
//  ViewController.swift
//  HW1_ lifecycle
//
//  Created by Iryna Mishyna on 13.09.2021.
//

import UIKit

class ViewController: UIViewController {
   
    // if the view controller is initialized from the code
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        print(#function)
    }
    
    
    // for drawing UI and Storyboard1 and initialization via storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // logic behind UI initialization
    override func loadView() {
        super.loadView()
        print(#function)
    }
    
    // logic that must be executed once
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
}

