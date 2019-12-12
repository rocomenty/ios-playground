//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var botButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var midButton: UIButton!
    var timer = Timer()
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(userAnswer: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let choices = quizBrain.getChoicesText()
        print(choices)
        topButton.setTitle(choices[0], for: .normal)
        midButton.setTitle(choices[1], for: .normal)
        botButton.setTitle(choices[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        topButton.backgroundColor = UIColor.clear
        midButton.backgroundColor = UIColor.clear
        botButton.backgroundColor = UIColor.clear
    }
    
}

