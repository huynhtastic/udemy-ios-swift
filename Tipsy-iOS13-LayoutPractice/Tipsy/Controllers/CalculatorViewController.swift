//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumLabel: UILabel!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var numToSplit = 2
    var tip = 0
    var splitTotal: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch sender.currentTitle! {
        case "0%":
            zeroPctButton.isSelected = true
            tip = 0
            break
        case "10%":
            tenPctButton.isSelected = true
            tip = 10
            break
        case "20%":
            twentyPctButton.isSelected = true
            tip = 20
            break
        default:
            print("Wrong button pressed!")
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numToSplit = Int(sender.value)
        updateUI()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = Float(billTextField.text ?? "0.0") ?? 0.0
        var percentage: Float = 1.0
        if (tenPctButton.isSelected) { percentage = 1.1 }
        if (twentyPctButton.isSelected) { percentage = 1.2 }
        splitTotal = (total * percentage) / Float(numToSplit)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func updateUI() {
        splitNumLabel.text = String(numToSplit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
      if segue.identifier == "goToResult",
         let resultsVC = segue.destination as? ResultsViewController {
          resultsVC.total = splitTotal
          resultsVC.tip = tip
          resultsVC.numToSplit = numToSplit
      }
    }
}

