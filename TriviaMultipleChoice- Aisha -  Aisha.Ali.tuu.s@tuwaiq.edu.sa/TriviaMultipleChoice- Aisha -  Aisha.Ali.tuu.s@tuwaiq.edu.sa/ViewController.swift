//
//  ViewController.swift
//  TriviaMultipleChoice- Aisha -  Aisha.Ali.tuu.s@tuwaiq.edu.sa
//
//  Created by Aisha Ali on 10/21/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var allQuestions  = QuestionsAndAnswers()
  
  var audioPlayer:AVAudioPlayer = AVAudioPlayer()
  var timer:Timer = Timer()
  var score : Int = 0
  var selectedAnswer : String = ""
  var quetionNumber = 0
  var rightQuestion = 0
  var wrongQuestion = 0
  
  
  
  
  @IBOutlet weak var valueScoreLabel: UILabel!
  @IBOutlet weak var questionsLabel: UILabel!
  @IBOutlet weak var firstButton: UIButton!
  @IBOutlet weak var secondButton: UIButton!
  @IBOutlet weak var thirdButton: UIButton!
  @IBOutlet weak var fourthButton: UIButton!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var questionsView: UIView!
  
  
  override func viewDidLoad() {
    
    
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    // First Button
    firstButton.layer.borderWidth = 3
    firstButton.layer.cornerRadius = 20
    firstButton.layer.borderColor = UIColor.white.cgColor
    firstButton.backgroundColor = .clear
    
    //Second Button
    secondButton.layer.borderWidth = 3
    secondButton.layer.cornerRadius = 20
    secondButton.layer.borderColor = UIColor.white.cgColor
    secondButton.backgroundColor = .clear
    //Third Button
    thirdButton.layer.borderWidth = 3
    thirdButton.layer.cornerRadius = 20
    thirdButton.layer.borderColor = UIColor.white.cgColor
    thirdButton.backgroundColor = .clear
    //Forth Button
    fourthButton.layer.borderWidth = 3
    fourthButton.layer.cornerRadius = 20
    fourthButton.layer.borderColor = UIColor.white.cgColor
    fourthButton.backgroundColor = .clear
    
    //Questions View
    questionsView.layer.cornerRadius = 20
    questionsView.backgroundColor = .clear
    
    //Question Label
    questionsLabel.layer.borderWidth = 10
    questionsLabel.layer.cornerRadius = 10
//      questionsLabel.backgroundColor = .clear
    questionsLabel.layer.borderColor = UIColor.white.cgColor

    
    valueScoreLabel.text = ""
    questionsLabel.text = ""
    
    //
    progressView.progress = 0.0
    updateQuestion()
  }
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    let userSelected = sender.currentTitle!
    if userSelected == selectedAnswer {
      sender.backgroundColor = UIColor.green
      score += 5
      rightQuestion += 1
      print(rightQuestion)
      valueScoreLabel.text = "\(score)"
      
    }else{
      
      sender.backgroundColor = UIColor.red
      score -= 10
      wrongQuestion += 1
      print(wrongQuestion)
      valueScoreLabel.text = "\(score)"
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
      sender.backgroundColor = UIColor.clear})
    
    if getNextQuestion() {
      timer = Timer.scheduledTimer(timeInterval: 0.5
                                   , target: self
                                   , selector: #selector(updateQuestion)
                                   , userInfo: nil
                                   , repeats: true)
    }else{
      resultAlert()
    }
  }
  
  
  
  
  @objc func updateQuestion (){
    if quetionNumber <= allQuestions.questionsList.count - 1  {
      progressView.setProgress(Float(getProgress()), animated: true)
      questionsLabel.text = allQuestions.questionsList[quetionNumber].question
      firstButton.setTitle(allQuestions.questionsList[quetionNumber].answers[0], for: .normal)
      secondButton.setTitle(allQuestions.questionsList[quetionNumber].answers[1], for: .normal)
      thirdButton.setTitle(allQuestions.questionsList[quetionNumber].answers[2], for: .normal)
      fourthButton.setTitle(allQuestions.questionsList[quetionNumber].answers[3], for: .normal)
      selectedAnswer = allQuestions.questionsList[quetionNumber].correctAnswer
      progressView.setProgress(Float(getProgress()), animated: true)
    }
  }

  func  hasUserGoodScore(){
    if rightQuestion  > wrongQuestion{
      playSound(name: "clap")
    }else{
      playSound(name: "fail")
    }
  }
  
  
  func resultAlert(){
    hasUserGoodScore ()
    let resetAlert = UIAlertController(title: "The Game is Over"
                                       , message: "Your Score is \(score) out of 10"
                                       , preferredStyle: .alert)
    
    resetAlert.addAction(UIAlertAction(title: "Play Again",
                                       style: UIAlertAction.Style.default
                                       ,handler: (startGameAgain)))
    present(resetAlert, animated: true)
  }
  
  func startGameAgain(action:UIAlertAction){
    score = 0
    updateQuestion ()
    quetionNumber = 0
    wrongQuestion = 0
    rightQuestion = 0
    audioPlayer.stop()
    
  }
  
  func playSound(name:String) {
    
    if  let pathSound = Bundle.main.path(forResource: name, ofType: "wav"){
      let url = URL(fileURLWithPath: pathSound)
      audioPlayer = try! AVAudioPlayer(contentsOf: url)
      audioPlayer.play()
    }
    print("yeeeeeeessssssss")
  }
  
  func getProgress() -> Float{
    return Float(quetionNumber+1) / Float(allQuestions.questionsList.count)
  }
  
 
  func getNextQuestion() ->Bool{
    if quetionNumber + 1  < allQuestions.questionsList.count{
      quetionNumber += 1
      return true
    }else{
      return false
    }
  }
  
  
}


