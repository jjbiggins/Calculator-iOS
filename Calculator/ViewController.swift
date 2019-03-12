//
//  ViewController.swift
//  Calculator
//
//  Created by Joe Biggins on 3/12/19.
//  Copyright © 2019 Joe Biggins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theDisplay: UILabel!
    
    var isUserEnterningNumber = false
    
    var calcBrain = CalculatorModel()
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let whichDigit = sender.currentTitle!
        print("digit pressed: \(whichDigit)")
        let currentDisplayText = theDisplay.text!
        if isUserEnterningNumber {
            theDisplay.text = currentDisplayText + whichDigit
        } else {
            theDisplay.text = sender.currentTitle!
            isUserEnterningNumber  = true
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        let whichOperation = sender.currentTitle!
        print("operation pressed: \(whichOperation)")
        if isUserEnterningNumber {
            enterPressed()
        }
        let result = calcBrain.performOperation(whichOperation)
        theDisplay.text = "\(result)"
    }
    
    @IBAction func enterPressed() {
        let enteredNumber = Int(theDisplay.text!)!
        print("number entered: \(enteredNumber)")
        isUserEnterningNumber = false
        calcBrain.enterNumber(number: enteredNumber)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

