//
//  ViewController.swift
//  TriviaMultipleChoice-MarzouqAlmukhlif
//
//  Created by Marzouq Almukhlif on 15/03/1443 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var valueScoreLabel: UILabel!
  @IBOutlet weak var questionNumberLabel: UILabel!
  @IBOutlet weak var questionLabel: UITextView!
  @IBOutlet weak var optionAButton: UIButton!
  @IBOutlet weak var optionBButton: UIButton!
  @IBOutlet weak var optionCButton: UIButton!
  @IBOutlet weak var optionDButton: UIButton!
  @IBOutlet weak var progressBar: UIProgressView!
  
  
  var score:Float = 0.0
  var allQuestions = Questions()
  var questionNumber:Int = 0
  var answerQuestion:String!
  var player:AVAudioPlayer?
  var totalScore:Float = 0.0
  var avrageScore:Float = 0.0
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureButons()
  }
  
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    if sender.titleLabel?.text == answerQuestion {
      print("Correct")
      score += 5
      playAlarm("Correct")
    } else {
      print("Incorrect")
      score -= 10
      playAlarm("Incorrect")
    }
    updateButton(sender)

    UserDefaults.standard.setValue(score, forKey: "score")
    questionNumber += 1
    nextQuestion()
  }
  
  func updateButton(_ sender:UIButton) {
    if sender.titleLabel?.text == answerQuestion && sender.tag == 1 {
      optionAButton.backgroundColor = .systemGreen
      optionAButton.setTitleColor(.white, for: .normal)
    } else if sender.titleLabel?.text == answerQuestion && sender.tag == 2 {
      optionBButton.backgroundColor = .systemGreen
      optionBButton.setTitleColor(.white, for: .normal)
    } else if sender.titleLabel?.text == answerQuestion && sender.tag == 3 {
      optionCButton.backgroundColor = .systemGreen
      optionCButton.setTitleColor(.white, for: .normal)
    } else if sender.titleLabel?.text == answerQuestion && sender.tag == 4 {
      optionDButton.backgroundColor = .systemGreen
      optionDButton.setTitleColor(.white, for: .normal)
    }
    
    if sender.titleLabel?.text != answerQuestion && sender.tag == 1 {
      optionAButton.backgroundColor = .systemRed
      optionAButton.setTitleColor(.white, for: .normal)
    } else if sender.titleLabel?.text != answerQuestion && sender.tag == 2 {
      optionBButton.backgroundColor = .systemRed
      optionBButton.setTitleColor(.white, for: .normal)
    } else if sender.titleLabel?.text != answerQuestion && sender.tag == 3 {
      optionCButton.backgroundColor = .systemRed
      optionCButton.setTitleColor(.white, for: .normal)
    } else if sender.titleLabel?.text != answerQuestion && sender.tag == 4 {
      optionDButton.backgroundColor = .systemRed
      optionDButton.setTitleColor(.white, for: .normal)
    }
    
    if optionAButton.titleLabel?.text == answerQuestion && sender.titleLabel?.text != optionAButton.titleLabel?.text {
      optionAButton.backgroundColor = .systemGreen
      optionAButton.setTitleColor(.white, for: .normal)
    } else if optionBButton.titleLabel?.text == answerQuestion && sender.titleLabel?.text != optionBButton.titleLabel?.text {
      optionBButton.backgroundColor = .systemGreen
      optionBButton.setTitleColor(.white, for: .normal)
    } else if optionCButton.titleLabel?.text == answerQuestion && sender.titleLabel?.text != optionCButton.titleLabel?.text {
      optionCButton.backgroundColor = .systemGreen
      optionCButton.setTitleColor(.white, for: .normal)
    } else if optionDButton.titleLabel?.text == answerQuestion && sender.titleLabel?.text != optionDButton.titleLabel?.text {
      optionDButton.backgroundColor = .systemGreen
      optionDButton.setTitleColor(.white, for: .normal)
    }
  }
  
  
  func configureButons() {
    updateData()
    updateQuestion()
    updateUI()
  }
  
  
  func nextQuestion() {
    Timer.scheduledTimer(
      timeInterval: 1.0,
      target: self,
      selector: #selector(updateQuestion),
      userInfo: nil, repeats: false
    )
  }
  
  
  @objc func updateQuestion() {
    totalScore = Float(questionNumber * 5)
    avrageScore = totalScore * 0.7
    if questionNumber <= allQuestions.getQuestion().count - 1 {
      UserDefaults.standard.set(questionNumber, forKey: "qusetionNumber")
      questionLabel.text = allQuestions.getQuestion()[questionNumber].question
      optionAButton.setTitle(allQuestions.getQuestion()[questionNumber].answers[0], for: .normal)
      optionBButton.setTitle(allQuestions.getQuestion()[questionNumber].answers[1], for: .normal)
      optionCButton.setTitle(allQuestions.getQuestion()[questionNumber].answers[2], for: .normal)
      optionDButton.setTitle(allQuestions.getQuestion()[questionNumber].answers[3], for: .normal)
      answerQuestion = allQuestions.getQuestion()[questionNumber].correctAnswer
      updateUI()
    } else {
      updateUI()
      hasUserGoodScore()
      showAlert("Game Over","Do you want to start over?")
    }
    
  }
  
  
  func updateUI() {
    optionAButton.backgroundColor = .clear
    optionBButton.backgroundColor = .clear
    optionCButton.backgroundColor = .clear
    optionDButton.backgroundColor = .clear
    
    optionAButton.setTitleColor(UIColor(hex: 0xE36856), for: .normal)
    optionBButton.setTitleColor(UIColor(hex: 0xE36856), for: .normal)
    optionCButton.setTitleColor(UIColor(hex: 0xE36856), for: .normal)
    optionDButton.setTitleColor(UIColor(hex: 0xE36856), for: .normal)

    valueScoreLabel.text = "\(Int(score))"
    if UserDefaults.standard.integer(forKey: "HighestScore") < Int(score) {
      UserDefaults.standard.setValue(Int(score), forKey: "HighestScore")
    }
    if questionNumber <= allQuestions.getQuestion().count - 1 {
      questionNumberLabel.text = "Question \(questionNumber + 1) of \(allQuestions.getQuestion().count)"
    }
    progressBar.progress = Float(Float(questionNumber + 1) / Float(allQuestions.getQuestion().count))
  }
  
  
  func updateData() {
    // data for Questions
    if (UserDefaults.standard.object(forKey: "qusetionNumber") == nil) {
      UserDefaults.standard.set(0, forKey: "qusetionNumber")
    }
    questionNumber = UserDefaults.standard.integer(forKey: "qusetionNumber")
    
    
    // data for score
    if (UserDefaults.standard.object(forKey: "score") == nil) {
      UserDefaults.standard.set(0, forKey: "score")
    }
    score = UserDefaults.standard.object(forKey: "score") as! Float
  }
  
  
  func hasUserGoodScore() {
    score > avrageScore ? playAlarm("Winner") : playAlarm("Fail")
  }
  
  
  func restart() {
    score = 0
    questionNumber = 0
    updateQuestion()
  }
  
  
  func showAlert(_ title:String,_ message:String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let restartAction = UIAlertAction(title: "Yes", style: .default, handler: {action in self.restart()})
    
    alert.addAction(restartAction)
    present(alert, animated: true, completion: nil)
    
  }
  
  
  func playAlarm(_ name:String) {
    guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  
}

