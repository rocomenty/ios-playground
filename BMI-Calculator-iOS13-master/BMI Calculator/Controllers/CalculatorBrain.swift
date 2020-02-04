//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Cheng Luo on 2/3/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        self.bmi = BMI(value: weight / pow(height, 2))
    }
    
    func getBMIValue() -> BMI? {
        return self.bmi
    }
}
