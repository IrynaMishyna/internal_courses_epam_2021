//
//  Classes.swift
//  NSObject
//
//  Created by Iryna Mishyna on 25.11.2021.
//

import Foundation

class FirstClass: NSObject, MyProtocol {
    
    
    // private properties for a class  inherited from NSObject
    @objc dynamic private var firstProperty = "firstProperty"
    
    
    func oneMethod() {
        print(firstProperty)
    }
    
}

class SecondClass: NSObject, MyProtocol {
    
    func twoMethod() {
        print("twoMethod")
    }
    
}

