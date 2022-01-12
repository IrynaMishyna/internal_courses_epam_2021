//
//  ViewController.swift
//  NSObject
//
//  Created by Iryna Mishyna on 25.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let protObj: MyProtocol = FirstClass()
        protObj.oneMethod?()
        
        print("---KVC---")
        let firstClassObj = FirstClass()
        firstClassObj.oneMethod()
        //.setValue("rainbow", forKey: "firstProperty")
        firstClassObj.value(forKey: "firstProperty" )
        firstClassObj.oneMethod()

    }
    


}

class Cat: NSObject {
    
}
