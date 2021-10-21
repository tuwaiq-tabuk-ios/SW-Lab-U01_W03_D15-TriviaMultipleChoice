//
//  ViewController.swift
//  TriviaMultipleChoice-“Mona_Misfer”
//
//  Created by mona M on 21/10/2021.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var valueScoreLable: UILabel!
  @IBOutlet weak var questionLable: UILabel!
  
  @IBOutlet weak var OptionFirstButton: UIButton!
  @IBOutlet weak var OptionSecondButton: UIButton!
  @IBOutlet weak var OptionThirdButton: UIButton!
  @IBOutlet weak var OptionFourthButton: UIButton!
  
  var currentProgress  = 0
  var quiz : Quiz = Quiz()
  var score = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureButtons()
    progressBar.progress = 0
    valueScoreLable.text = "Score : \(score)"
    
    updateUI()
    
  }
  
  
  @IBAction func answerPressed(_ sender: UIButton) {
    let selectedValue = sender.currentTitle!
    let isCorrect = quiz.getAnswer(selectedValue)
    
    if isCorrect {
      sender.backgroundColor = UIColor.green
    }else{
      sender.backgroundColor = UIColor.red
    }
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute:{
      sender.backgroundColor = UIColor.gray
    })
    quiz.getNextQuestion()
    
    if quiz.questionNumber == quiz.questions.count {
      showMessage()
    }
    updateUI()
    
  }
  
  
  func updateUI(){
    progressBar.progress = quiz.getProgress()
    if quiz.questionNumber < quiz.questions.count {
      questionLable.text = quiz.getQuestion()
    }
    
    valueScoreLable.text = "Score : \(quiz.getScore())"
    
  }
  
  
  func configureButtons() {
    OptionFirstButton.backgroundColor = .white
    OptionFirstButton.layer.cornerRadius = round(10)
    OptionFirstButton.layer.borderWidth = 3
    OptionFirstButton.layer.borderColor = UIColor.black.cgColor
    
    OptionSecondButton.backgroundColor = .white
    OptionSecondButton.layer.cornerRadius = 10
    OptionSecondButton.layer.borderWidth = 3
    OptionSecondButton.layer.borderColor = UIColor.black.cgColor
    
    OptionThirdButton.backgroundColor = .white
    
    OptionThirdButton.layer.cornerRadius = 10
    OptionThirdButton.layer.borderWidth = 3
    OptionThirdButton.layer.borderColor = UIColor.black.cgColor
    
    OptionFourthButton.backgroundColor = .white
    OptionFourthButton.layer.cornerRadius = 10
    OptionFourthButton.layer.borderWidth = 3
    OptionFourthButton.layer.borderColor = UIColor.black.cgColor
    
    
    
  }
  
  func showMessage() {
    let alert = UIAlertController(title: "Game Over", message: "", preferredStyle: UIAlertController.Style.alert)
    
    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
      //Cancel Action
    }))
    
    
    self.present(alert, animated: true, completion: nil)
  }
}

        
        
          
     

