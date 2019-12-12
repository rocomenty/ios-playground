//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Cheng Luo on 12/11/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    let choice: [String]
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = correctAnswer
        self.choice = a
    }
}
