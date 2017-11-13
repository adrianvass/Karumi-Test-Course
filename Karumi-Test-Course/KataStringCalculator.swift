//
//  KataCalculator.swift
//  Karumi-Test-Course
//
//  Created by VASS on 13/11/2017.
//

import Foundation

enum CalculatorError: Error {
    case negativeNumbersFound(String)
}

struct KataStringCalculator {
    func sum(_ string: String) throws -> Int {
        if string == "" { return 0 }
        
        let workingStr = string.replacingOccurrences(of: "\n", with: ",")
        
        var invalidNumbers: [Int] = []
        var validNumbers: [Int] = []
        
        workingStr.split(separator: ",").forEach { strNumber in
            if let intNum = Int(strNumber) {
                if intNum >= 0 {
                    validNumbers.append(intNum)
                } else {
                    invalidNumbers.append(intNum)
                }
            } else {
                fatalError("Ups, you need new features")
            }
        }
        
        if invalidNumbers.count > 0 {
            throw CalculatorError.negativeNumbersFound("\(invalidNumbers.map(String.init).joined(separator: ","))")
        }
        
        return validNumbers.reduce(0, +)
    }
}
