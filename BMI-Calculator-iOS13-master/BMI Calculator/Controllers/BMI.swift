//
//  BMI.swift
//  BMI Calculator
//
//  Created by Cheng Luo on 2/3/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor
    
    init(value: Float) {
        self.value = value
        if value < 18.5 {
            self.advice = "Eat More Pies. "
            self.color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        } else if value < 24.9 {
            self.advice = "Fit as a Fiddle. "
            self.color = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            self.advice = "Eat Less Pies. "
            self.color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    func toString() -> String {
        return String(format: "%.2f", self.value)
    }
}
