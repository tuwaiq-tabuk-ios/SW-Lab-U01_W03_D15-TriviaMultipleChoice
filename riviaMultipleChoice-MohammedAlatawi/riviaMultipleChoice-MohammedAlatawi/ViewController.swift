//
//  ViewController.swift
//  riviaMultipleChoice-MohammedAlatawi
//
//  Created by محمد العطوي on 15/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueScoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var optionFirstButton: UIButton!
    @IBOutlet weak var optionSecondButton: UIButton!
    @IBOutlet weak var optionThirdButton: UIButton!
    @IBOutlet weak var optionFourthButton: UIButton!
    
    var Score:Int = 0
    
    var selectedAnswer:Int = 0
    
    var questionBank = QuestionBank ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        questionLabel.text = questionBank.getQuestion()
        optionFirstButton.setTitle(questionBank.getAnswers(Index: 0), for: .normal)
        optionSecondButton.setTitle(questionBank.getAnswers(Index: 1), for: .normal)
        optionThirdButton.setTitle(questionBank.getAnswers(Index: 2), for: .normal)
        optionFourthButton.setTitle(questionBank.getAnswers(Index: 3), for: .normal)
    
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text
        if questionBank.checkAnswers(userAnswer!) {
            print("Correct")
            
        }else {
            print("Incorrect")

        }
        updatwUi()
    }
    
    
    @objc func updatwUi() {
        questionLabel.text = questionBank.getQuestion()
        optionFirstButton.setTitle(questionBank.getAnswers(Index: 0), for: .normal)
        optionSecondButton.setTitle(questionBank.getAnswers(Index: 1), for: .normal)
        optionThirdButton.setTitle(questionBank.getAnswers(Index: 2), for: .normal)
        optionFourthButton.setTitle(questionBank.getAnswers(Index: 3), for: .normal)
        
        progressBar.progress = questionBank.getprogress()
        
        valueScoreLabel.text = "Score:\(questionBank.getScore())"
        optionFirstButton.backgroundColor = UIColor.white
        optionSecondButton.backgroundColor = UIColor.white
        optionThirdButton.backgroundColor = UIColor.white
        optionFourthButton.backgroundColor = UIColor.white
        
    }
    
    
}

