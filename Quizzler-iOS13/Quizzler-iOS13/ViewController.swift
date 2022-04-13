//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    var quizBrain = QuizBrain() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        
        if (isCorrect) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        updateUI()
        
    }
    
    func updateUI() {
        let answers = quizBrain.getAnswers()
        questionLabel.text = quizBrain.getQuestionText()
        choiceOneButton.setTitle(answers[0], for: .normal)
        choiceTwoButton.setTitle(answers[1], for: .normal)
        choiceThreeButton.setTitle(answers[2], for: .normal)
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.choiceOneButton.backgroundColor = UIColor.clear
            self.choiceTwoButton.backgroundColor = UIColor.clear
            self.choiceThreeButton.backgroundColor = UIColor.clear
        }
    }
}

