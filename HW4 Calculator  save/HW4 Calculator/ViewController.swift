//
//  ViewController.swift
//  HW4 Calculator
//
//  Created by Iryna Mishyna on 01.10.2021.
//

import UIKit

enum Operation: String {
    case add = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!

    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL

    override func viewDidLoad() {
        super.viewDidLoad()

        outputLabel.text = "0"
    }
    
    @IBAction func numberPressdButtons(_ sender: RoundButton) {
        if runningNumber.count <= 16 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func clearPressedButton(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    
    @IBAction func dotPressedButton(_ sender: RoundButton) {
        runningNumber += "."
        outputLabel.text = runningNumber
    }
    
    @IBAction func equalPressedButton(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func plusPressedButton(_ sender: RoundButton) {
        operation(operation: .add)
    }
   
    @IBAction func minusPressedButton(_ sender: RoundButton) {
        operation(operation: .minus)
    }
    
    @IBAction func multiplyPressedButton(_ sender: RoundButton) {
        operation(operation: .multiply)
    }
    
    @IBAction func dividePressedButton(_ sender: RoundButton) {
        operation(operation: .divide)

    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "",
            let leftValue = Double(leftValue),
            let rightValue = Double(runningNumber) {
                runningNumber = ""
                var numericResult = -1.0
                switch currentOperation {
                case .add:
                    numericResult = leftValue + rightValue
                case .minus:
                    numericResult = leftValue - rightValue
                case .divide:
                    numericResult = leftValue / rightValue
                case .multiply:
                    numericResult = leftValue * rightValue
                case .NULL:
                    break
                }

                result = "\(numericResult)"
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}
