//
//  ViewController.swift
//  TriviMultipleChoice_App
//
//  Created by Mohammed on 15/03/1443 AH.
//Mohammed Saqer Aloqbi

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var quizBrain = QuestionBank()
    //Outlet Buttons
    @IBOutlet weak var optionFirstButton: UIButton!
    @IBOutlet weak var optionSecondButton: UIButton!
    @IBOutlet weak var optionThirdButton: UIButton!
    @IBOutlet weak var optionFourthButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionNumber = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateTheQuestion()
        // Do any additional setup after loading the view.
   
    
    }


        @IBAction func answerButtonPressed(_ sender: UIButton) {
       
        
            let userAnswer = sender.currentTitle!
            
            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
            
            if userGotItRight {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        }
        
        @objc func updateUI() {
            questionLabel.text = quizBrain.getQuestionText()
            
            //Need to fetch the answers and update the button titles using the setTitle method.
            let answerChoices = quizBrain.getAnswers()
            optionFirstButton.setTitle(answerChoices[0], for: .normal)
            optionSecondButton.setTitle(answerChoices[1], for: .normal)
            optionThirdButton.setTitle(answerChoices[2], for: .normal)
            optionFourthButton.setTitle(answerChoices[3], for: .normal)
            progressBar.progress = quizBrain.getProgress()
            scoreValueLabel.text = "\(quizBrain.getScore())"
            
            optionFirstButton.backgroundColor = UIColor.systemOrange
            optionSecondButton.backgroundColor = UIColor.systemOrange
            optionThirdButton.backgroundColor = UIColor.systemOrange
            //Third button needs to be reset too.
            optionFourthButton.backgroundColor = UIColor.systemOrange
        }
    func updateTheQuestion(){
        let alert = UIAlertController(title: "Great work!", message:"Do Want to give it another shot?", preferredStyle: .alert)
        let reStartAction = UIAlertAction(title: "Yes", style: .default) { action in self.reStart()}
        alert.addAction(reStartAction)
        present(alert, animated: true, completion: nil)
   
        }
    func reStart(){
        score = 0
        questionNumber = 0
        updateTheQuestion()
    }

}
