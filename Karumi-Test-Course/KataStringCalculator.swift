//
//  KataCalculator.swift
//  Karumi-Test-Course
//
//  Created by VASS on 13/11/2017.
//

import Foundation

struct KataStringCalculator {
    func sum(_ string: String) -> Int {
        let workingStr = string.replacingOccurrences(of: "\n", with: ",")
        if workingStr.contains(",") {
            return workingStr.split(separator: ",").reduce(0, { (prevNumber, strNumber) -> Int in
                if let intNumb = Int(strNumber) {
                    return prevNumber + intNumb
                } else {
                    fatalError("Foraneous character inputted, please add a new feature.")
                }
            })
        } else if let number = Int(workingStr) {
            return number
        } else {
            return 0
        }
    }
}
