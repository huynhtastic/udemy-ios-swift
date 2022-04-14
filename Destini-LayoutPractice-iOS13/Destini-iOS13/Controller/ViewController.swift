//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceOneBtn: UIButton!
    @IBOutlet weak var choiceTwoBtn: UIButton!
    
    let stories = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest.", choice1: "Open it.", choice2: "Check for traps."),
    ]
    var storyIdx = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        if (sender.currentTitle! == stories[0].choice1) {
            storyIdx = 1
        } else {storyIdx = 2}
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = stories[storyIdx].title
        choiceOneBtn.setTitle(stories[storyIdx].choice1, for: .normal)
        choiceTwoBtn.setTitle(stories[storyIdx].choice2, for: .normal)
    }
}

