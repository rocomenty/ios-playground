//
//  Bill.swift
//  Tipsy
//
//  Created by Cheng Luo on 2/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var total: Float?
    var tipPercent: Float?
    var split: Int?
    
    func calculateGrandTotal() -> Float {
        if self.total != nil && self.tipPercent != nil {
            return self.total! * (1+self.tipPercent!)
        } else {
            return 0
        }
    }
    
    func calculateSplit() -> Float {
        if self.split != nil {
            return self.calculateGrandTotal() / Float(self.split!)
        } else {
            return 0
        }
    }
    
    mutating func changeTipPercent(label: String) {
        if label == "0%" {
            self.tipPercent = 0
        } else if label == "10%" {
            self.tipPercent = 0.1
        } else if label == "20%" {
            self.tipPercent = 0.2
        }
    }
    
    mutating func changeSplit(split: Int) {
        self.split = split
    }
}
