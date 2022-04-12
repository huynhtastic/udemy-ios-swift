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
    @IBOutlet weak var progressView: UIProgressView!
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let hardness = sender.currentTitle {
            timer.invalidate()
            
            let totalTime = eggTimes[hardness]!
            var secondsPassed = 0
            progressView.setProgress(0, animated: false)
            timerLabel.text = hardness
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if (secondsPassed >= totalTime) {
                    timer.invalidate()
                    self.timerLabel.text = "Done!"
                } else {
                    secondsPassed += 1
                    self.progressView.setProgress(Float(secondsPassed) / Float(totalTime), animated: false)
                }
                
            }

        }
    }
    


}
