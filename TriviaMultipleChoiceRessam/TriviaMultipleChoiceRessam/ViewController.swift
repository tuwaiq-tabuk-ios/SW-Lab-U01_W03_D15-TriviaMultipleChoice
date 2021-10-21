//
//  ViewController.swift
//  TriviaMultipleChoiceRessam
//
//  Created by Ressam Al-Thebailah on 15/03/1443 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var valueScoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var optionFirstButton: UIButton!
  @IBOutlet weak var optionSecondButton: UIButton!
  @IBOutlet weak var optionThirdButton: UIButton!
  @IBOutlet weak var optionFourthButton: UIButton!
  
  @IBOutlet weak var progressBar: UIProgressView!
  
  var player: AVAudioPlayer?
  var triviaBrain = TriviaBrain()
  var questionNumber = 0
  var score = 0
  var selectedAnswer :String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    updateQuestion()
    updateUI()
    configureButtons()
  }
  
  @IBAction func answerPressed(_ sender: UIButton) {
    if sender.title(for:.normal) == selectedAnswer {
      print("Correcy")
      sender.backgroundColor = .systemGreen
      score += 5
    } else{
      print("Worng")
      sender.backgroundColor = .systemRed
      score -= 5
    }
    
    questionNumber += 1
    updateQuestion()
  }
  
  
  func updateQuestion() {
    if questionNumber < triviaBrain.list.count{
      questionLabel.text = triviaBrain.list[questionNumber].question
      optionFirstButton.setTitle(triviaBrain.list[questionNumber].optionA,for:UIControl.State.normal)
      optionSecondButton.setTitle(triviaBrain.list[questionNumber].optionB,for:UIControl.State.normal)
      optionThirdButton.setTitle(triviaBrain.list[questionNumber].optionC,for:UIControl.State.normal)
      optionFourthButton.setTitle(triviaBrain.list[questionNumber].optionD,for:UIControl.State.normal)
      selectedAnswer = triviaBrain.list[questionNumber].correctAnswer
      
      Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }else {
      let alert = UIAlertController(title: "Awesome", message:"End of Quiz, do you want to start over?", preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartGame()})
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
      playSound()
    }
    updateUI()
  }
  
  
  @objc func updateUI(){
    valueScoreLabel.text = "Score : \(score)"
    progressBar.progress = getProgress()
    optionFirstButton.backgroundColor = UIColor.clear
    optionSecondButton.backgroundColor = UIColor.clear
    optionThirdButton.backgroundColor = UIColor.clear
    optionFourthButton.backgroundColor = UIColor.clear
  }
  
  
  func getProgress()->Float {
    return (Float(questionNumber+1)/Float(triviaBrain.list.count))}
  
  
  func restartGame(){
    score = 0
    questionNumber = 0
    updateQuestion()
  }
  
  
  func configureButtons() {
    optionFirstButton.layer.cornerRadius = 15
    optionFirstButton.layer.masksToBounds = true
    optionSecondButton.layer.cornerRadius = 15
    optionSecondButton.layer.masksToBounds = true
    optionThirdButton.layer.cornerRadius = 15
    optionThirdButton.layer.masksToBounds = true
    optionFourthButton.layer.cornerRadius = 15
    optionFourthButton.layer.masksToBounds = true
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
      guard let player = player else {
        return
      }
      player.play()
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
