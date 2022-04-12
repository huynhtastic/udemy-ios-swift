//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let hardness = sender.currentTitle {
            timer.invalidate()
            
            var time = eggTimes[hardness]!
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if (time == -1) { timer.invalidate()
                    self.timerLabel.text = "Done!"
                } else {
                    self.timerLabel.text = "\(time) seconds"
                    time -= 1
                }
                
            }

        }
    }
    


}
