//
//  ViewController.swift
//  TriviaMultipleChoice_"Bushra_Oudah"
//
//  Created by Bushra alatwi on 15/03/1443 AH.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
  
  
  @IBOutlet weak var TitleScoreLabel: UILabel!
  
  
  @IBOutlet weak var QuestionLabel: UILabel!
  
  @IBOutlet weak var ChoiceOne: UIButton!
  
  @IBOutlet weak var ChoiceTow: UIButton!
  
 
  
  @IBOutlet weak var ChoiceThree: UIButton!
  
  @IBOutlet weak var ChoiceFour: UIButton!
  
  
  @IBOutlet weak var progressView: UIProgressView!
  
 var quastionManger = QuastionManger()
  var change = 1
  var questionNumber:Int = 0
  var player: AVAudioPlayer?
  var nextQuestion:Int = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ChoiceOne.layer.cornerRadius = 15
    ChoiceOne.layer.masksToBounds = true
    ChoiceOne.layer.borderWidth = 2
    ChoiceOne.layer.borderColor = UIColor.black.cgColor
    
    
    ChoiceTow.layer.cornerRadius = 15
    ChoiceTow.layer.masksToBounds = true
    ChoiceTow.layer.borderWidth = 2
    ChoiceTow.layer.borderColor = UIColor.black.cgColor
    
    ChoiceThree.layer.cornerRadius = 15
    ChoiceThree.layer.masksToBounds = true
    ChoiceThree.layer.borderWidth = 2
    ChoiceThree.layer.borderColor = UIColor.black.cgColor
    
    ChoiceFour.layer.cornerRadius = 15
    ChoiceFour.layer.masksToBounds = true
    ChoiceFour.layer.borderWidth = 2
    ChoiceFour.layer.borderColor = UIColor.black.cgColor
    
    updateUI()
    progressView.progress = 0.0
  }


  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    
    let userAnswer = sender.currentTitle!
    let check = quastionManger.checkAnswer(userAnswer)
    
  
    if check{
      sender.backgroundColor = UIColor.green
    }
    else {
      sender.backgroundColor = UIColor.red
    }

    
    Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    
    if quastionManger.nextQuestion() {
    }
    else {
      showGameOverAlertMessage()
    }
}
    
  
  
  @objc func updateUI(){
              
    QuestionLabel.text = quastionManger.checkQuestion()
    progressView.progress = quastionManger.checkProgress()
    TitleScoreLabel.text = "\(quastionManger.checkScore())"
   
    
    ChoiceOne.backgroundColor = UIColor.clear
    ChoiceTow.backgroundColor = UIColor.clear
    ChoiceThree.backgroundColor = UIColor.clear
      ChoiceFour.backgroundColor = UIColor.clear
      
      ChoiceOne.setTitle(quastionManger.checkChoices()[0], for: .normal)
      ChoiceTow.setTitle(quastionManger.checkChoices()[1], for: .normal)
    ChoiceThree.setTitle(quastionManger.checkChoices()[2], for: .normal)
    ChoiceFour.setTitle(quastionManger.checkChoices()[3], for: .normal)
    
  }
  
  
  func startGame(action : UIAlertAction! = nil) {
    print(#function)
    startGame ()
    updateUI()
  }
  
  
  
  func showGameOverAlertMessage(){
    
    let ac = UIAlertController(title: "GAME OVER",
                               message: "Your scores is",
                               preferredStyle: .alert )
    
    
    ac.addAction(UIAlertAction(
                  title: "Yes",
                  style: .default,
                  handler: { action in
      print("Yes clicked")
    }))
    
    ac.addAction(UIAlertAction(title: "No",
                               style: .cancel,
                               handler: nil))
    
    present(ac, animated: true, completion: nil)
    playSound()
    
  }
  func playSound() {
      guard let url = Bundle.main.url(forResource: "clapping", withExtension: "mp3") else { return }
      
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
    
    func start() {
      quastionManger.start()
      updateUI()
    }
  }
  

  
