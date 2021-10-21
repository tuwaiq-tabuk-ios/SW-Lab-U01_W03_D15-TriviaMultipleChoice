//
//  ViewController.swift
//  TriviaMultipleChoice-Shuruq
//
//  Created by Shorouq AlAnzi on 15/03/1443 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var quizManager = QuizManager()
  var change = 0
  var player: AVAudioPlayer?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    questionLabel.layer.borderWidth = 3
    questionLabel.layer.cornerRadius = 70
    
    
    firstButton.layer.cornerRadius = 50
    firstButton.layer.backgroundColor = UIColor.white.cgColor
    firstButton.layer.borderWidth = 3
    
    secondButton.layer.cornerRadius = 50
    secondButton.layer.backgroundColor = UIColor.white.cgColor
    secondButton.layer.borderWidth = 3
    
    thirdButton.layer.cornerRadius = 50
    thirdButton.layer.backgroundColor = UIColor.white.cgColor
    thirdButton.layer.borderWidth = 3
    
    fourthButton.layer.cornerRadius = 50
    fourthButton.layer.backgroundColor = UIColor.white.cgColor
    fourthButton.layer.borderWidth = 3
    
    valueScoreLabel.text = "Score: \(quizManager.getScore())"
    
    updateUI()
  
    
  }
  
  @IBOutlet weak var valueScoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var firstButton: UIButton!
  
  @IBOutlet weak var secondButton: UIButton!
  
  @IBOutlet weak var thirdButton: UIButton!
  
  @IBOutlet weak var fourthButton: UIButton!
  
  @IBOutlet weak var ProgressBar: UIProgressView!
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    let check = quizManager.checkAnswer(userAnswer)
    
    if check {
      sender.backgroundColor = .systemGreen
      
    }
    
    else {
      sender.backgroundColor = .systemRed
      
    }
    Timer.scheduledTimer(timeInterval: 1.2,
                         target: self,
                         selector: #selector(updateUI),
                         userInfo: nil,
                         repeats: false)
    if quizManager.nextQuestion(){
      
    } else {
      showGameOverAlertMessage()
    }
  }
  
  func startGame(action: UIAlertAction! = nil){
    print(#function)
    quizManager.startGame()
    updateUI()
    
  }
  
  @objc func updateUI(){
    valueScoreLabel.text = String(quizManager.getScore())
    questionLabel.text = quizManager.getQuestion()
    firstButton.backgroundColor = UIColor.clear
    secondButton.backgroundColor = UIColor.clear
    thirdButton.backgroundColor = UIColor.clear
    fourthButton.backgroundColor = UIColor.clear
    
    
    firstButton.setTitle(quizManager.checkChoices()[0], for: .normal)
    secondButton.setTitle(quizManager.checkChoices()[1], for: .normal)
    
    thirdButton.setTitle(quizManager.checkChoices()[2], for: .normal)
    fourthButton.setTitle(quizManager.checkChoices()[3], for: .normal)
    ProgressBar.progress = quizManager.getProgress()
  }
  
  func showGameOverAlertMessage(){
   
    
    let userScore = quizManager.getScore()
    let goodScore = (userScore * 70) / 100
    print("good score = \(goodScore)")
    
    
    if quizManager.getScore() >= goodScore {
      let alert = UIAlertController(title: "Congrationas!", message: " Your Score is \(quizManager.getScore()) out of 25", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Okay", style: .cancel , handler:startGame ))
      present(alert, animated : true, completion: nil)
      playSound()
    }else{
      let alert = UIAlertController(title: "game Over", message: " Your Score is \(quizManager.getScore()) out of 25", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Okay", style: .cancel , handler:startGame ))
      present(alert, animated : true, completion: nil)
      
      stopSound()
    }
  }
  func playSound() {
    guard let url = Bundle.main.url(forResource: "clapping", withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      /* The following line is required for the player to work on
       iOS 11. Change the file type accordingly*/
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  func stopSound(){
    player?.stop()
  }
}


