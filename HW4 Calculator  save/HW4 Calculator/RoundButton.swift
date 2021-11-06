//
//  RoundButton.swift
//  HW4 Calculator
//
//  Created by Iryna Mishyna on 02.10.2021.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
