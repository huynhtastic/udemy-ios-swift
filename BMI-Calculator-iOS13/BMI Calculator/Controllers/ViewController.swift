//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let formattedValue = String(format: "%.2f", sender.value)
        heightValueLabel.text = "\(formattedValue)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let formattedValue = Int(sender.value)
        weightValueLabel.text = "\(formattedValue)Kg"
    }
}

