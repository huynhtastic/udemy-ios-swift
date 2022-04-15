//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Richard Huynh on 4/15/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmi: Float?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / pow(height, 2)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi)
    }
}
