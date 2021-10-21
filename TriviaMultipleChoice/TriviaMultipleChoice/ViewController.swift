//
//  ViewController.swift
//  TriviaMultipleChoice
//
//  Created by عبدالعزيز البلوي on 15/03/1443 AH.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  
  
  @IBOutlet weak var lbQuestion: UILabel!
  
  @IBOutlet weak var valueScoreLabel: UILabel!
  
  @IBOutlet weak var a1: UIButton!
  
  @IBOutlet weak var b2: UIButton!
  
  @IBOutlet weak var c3: UIButton!
  
  @IBOutlet weak var d4: UIButton!
  
  @IBOutlet weak var progressBar: UIProgressView!
  var questionBan = questionBank()
  var userGotRight = false
  var player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    progressBar.progress = 0
    lbQuestion.text = questionBan.getQuestionTex()
    a1.setTitle(questionBan.getAnswers(index: 0), for: .normal)
    b2.setTitle(questionBan.getAnswers(index: 1), for: .normal)
    c3.setTitle(questionBan.getAnswers(index: 2), for: .normal)
    d4.setTitle(questionBan.getAnswers(index: 3), for: .normal)
    // Do any additional setup after loading the view.
  }
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    userGotRight = questionBan.chekAnswers(sender.currentTitle!)
    if userGotRight {
      sender.backgroundColor = UIColor.green
      
    }else{
      sender.backgroundColor = UIColor.red
    }
    questionBan.nextQ()
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    
  }
  @objc func updateUI(){
    lbQuestion.text = questionBan.getQuestionTex()
    a1.setTitle(questionBan.getAnswers(index: 0), for: .normal)
    b2.setTitle(questionBan.getAnswers(index: 1), for: .normal)
    c3.setTitle(questionBan.getAnswers(index: 2), for: .normal)
    d4.setTitle(questionBan.getAnswers(index: 3), for: .normal)
    progressBar.progress = questionBan.getProgreess()
    valueScoreLabel.text = "\(questionBan.getScore())"
    a1.backgroundColor = UIColor.black
    b2.backgroundColor = UIColor.black
    c3.backgroundColor = UIColor.black
    d4.backgroundColor = UIColor.black
  }
  
  func playSound() {
    guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
    
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

