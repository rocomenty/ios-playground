//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":3, "Medium":420, "Hard":720]
    
    let alarmSound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    
    var secondsRemain = 0
    
    var totalSeconds = 0
    
    var player: AVAudioPlayer?
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        secondsRemain = eggTimes[sender.currentTitle!]!
        totalSeconds = eggTimes[sender.currentTitle!]!
        progressBar.progress = 1.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsRemain > 0 {
            print("\(secondsRemain):  seconds")
            secondsRemain -= 1
            progressBar.progress = Float(secondsRemain) / Float(totalSeconds)
        } else if secondsRemain == 0 {
            timer.invalidate()
            playSound(url: alarmSound!)
            titleLabel.text = "Done!"
        }
    }
    
    func playSound(url: URL) {
        player = try! AVAudioPlayer(contentsOf: url)
        player!.play()
    }
    
}
