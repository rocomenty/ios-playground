//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Cheng Luo on 2/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var bill: Bill?
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(format: "%.2f", (bill?.calculateSplit())!)
        if bill != nil {
            let realBill = bill!
            settingsLabel.text = "Split between " + String(realBill.split!) + " people, with " + String(format: "%.0f", realBill.tipPercent! * 100) + "% tip. "
        } else {
            settingsLabel.textColor = .red
            settingsLabel.text = "Error: Bill is not valid. "
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
