//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Joe Biggins on 3/12/19.
//  Copyright © 2019 Joe Biggins. All rights reserved.
//

import Foundation

struct Stack {
    var data: [Int] = []
    
    mutating func push(_ number:Int) {
        data.append(number)
    }
    
    mutating func pop() -> Int {
        let top:Int = data[data.count - 1]
        data.removeLast()
        return top
    }
    
}

class CalculatorModel {
        var stack = Stack()
        
        func performOperation(_ operation:String) -> Int {
            print("Calc received op request: \(operation)")
            let operand2 = stack.pop()
            let operand1 = stack.pop()
            let result: Int
            if operation == "+" {
                result = operand1 + operand2
            }
            else if operation == "-" {
                result = operand1 - operand2
            }
            else if operation == "x" {
                result = operand1 * operand2
            }
            else if operation == "/" {
                result = operand1 / operand2
            }
            else {
                result = 0
            }
            
            stack.push(result)
            return result
        }
        
        func enterNumber(number:Int) {
            print("Calc received : \(number)")
            stack.push(number)
        }
}
    

