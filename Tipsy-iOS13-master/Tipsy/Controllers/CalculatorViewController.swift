//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var bill: Bill?

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPCButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPCButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageLabel.contentMode = .scaleAspectFill
        stepper.value = 2
        bill = Bill(total: 0, tipPercent: 0.1, split: 2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPCButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPCButton.isSelected = false
        sender.isSelected = true
        bill?.changeTipPercent(label: sender.titleLabel!.text!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        bill?.changeSplit(split: Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let text = billTextField.text {
            let total = Float(text)
            if total != nil && total! > Float(0) {
                bill?.total = total
                self.performSegue(withIdentifier: "goToResult", sender: self)
            } else {
                self.fillLabel(label: messageLabel, color: .red, msg: "Error: Text is not a valid number")
            }
        } else {
            self.fillLabel(label: messageLabel, color: .red, msg: "Error: Text is empty. ")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultsViewController
            destination.bill = self.bill
        }
    }
    
    func fillLabel(label: UILabel, color: UIColor, msg: String) {
        label.textColor = color
        label.text = msg
    }
}

