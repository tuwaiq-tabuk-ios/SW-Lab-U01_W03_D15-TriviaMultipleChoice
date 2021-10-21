//
//  ViewController.swift
//  TriviaMultipleChoice-Areej
//
//  Created by A A on 15/03/1443 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var currentProgress : Int = 0
  var quiz : Quiz = Quiz()
  var score : Int = 0
  var player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    progressBar.progress = 0.0
    valueScoreLabel.text = "\(score)"
    configureButtons()
    update()
  }
  
  
  @IBOutlet weak var valueScoreLabel: UILabel!
  
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var optionFirstButton: UIButton!
  @IBOutlet weak var optionSecondButton: UIButton!
  @IBOutlet weak var optionThirdButton: UIButton!
  @IBOutlet weak var optionForthButton: UIButton!
  
  @IBOutlet weak var progressBar: UIProgressView!
  
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    quiz.getNextQuestion()
    
    let selectedValue = sender.currentTitle!
    let isCorrect = quiz.getAnswer(selectedValue)
    
    if isCorrect {
      sender.backgroundColor = UIColor.green
    }else{
      sender.backgroundColor = UIColor.red
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { sender.backgroundColor = UIColor.clear })
    
    update()
  }
  
  
  func update(){
    progressBar.progress = quiz.getProgress()
    if quiz.questionNumber < quiz.questions.count {
      questionLabel.text = quiz.getQuestion()
    }
    valueScoreLabel.text = "\(quiz.getScore())"
    
  }
  
  
  func playSound() {
    guard let url = Bundle.main.url(forResource: "clap", withExtension: "wav") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      /* iOS 10 and earlier require the following line:
       player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
      
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  
  func stopSound(){
    player?.stop()
  }
  
  
  func configureButtons(){
    
    optionFirstButton.layer.cornerRadius = 30
    optionFirstButton.layer.borderWidth = 3
    optionFirstButton.layer.borderColor = UIColor.white.cgColor
    
    optionSecondButton.layer.cornerRadius = 30
    optionSecondButton.layer.borderWidth = 3
    optionSecondButton.layer.borderColor = UIColor.white.cgColor
    
    optionThirdButton.layer.cornerRadius = 30
    optionThirdButton.layer.borderWidth = 3
    optionThirdButton.layer.borderColor = UIColor.white.cgColor
    
    optionForthButton.layer.cornerRadius = 30
    optionForthButton.layer.borderWidth = 3
    optionForthButton.layer.borderColor = UIColor.white.cgColor
    
  }
  
  func hasUserGoodScore() -> Bool {
    score == 5 ? true : false
  }
  
  
}

