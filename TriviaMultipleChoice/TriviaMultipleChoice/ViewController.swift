//
//  ViewController.swift
//  TriviaMultipleChoice
//
//  Created by Yousef Albalawi on 15/03/1443 AH.
//

import UIKit

class ViewController: UIViewController
{
  @IBOutlet weak var valueScoreLabel: UILabel!
  
  
  @IBOutlet weak var lueblQ1: UILabel!
  
  @IBOutlet weak var one: UIButton!
  
  @IBOutlet weak var two: UIButton!
  
  @IBOutlet weak var three: UIButton!
  
  @IBOutlet weak var fowr: UIButton!
  @IBOutlet weak var progressBar: UIProgressView!
    var questionBan = questionBank()
    var userGotRight = false
  override func viewDidLoad() {
    super.viewDidLoad()
    progressBar.progress = 0
    lueblQ1.text = questionBan.getQuestionTex()
    one.setTitle(questionBan.getAnswers(index: 0), for: .normal)
    two.setTitle(questionBan.getAnswers(index: 1), for: .normal)
    three.setTitle(questionBan.getAnswers(index: 2), for: .normal)
    fowr.setTitle(questionBan.getAnswers(index: 3), for: .normal)
  }
    // Do any additional setup after loading the view.
  
 
  @IBAction func arbuttonPrd(_ sender: UIButton) {
    userGotRight =
      questionBan.chekAnswers(sender.currentTitle!)
    if userGotRight {
      sender.backgroundColor = UIColor .green
    }else{
      sender.backgroundColor = UIColor.red
    }
    questionBan.nextQ()
    Timer.scheduledTimer(timeInterval: 0.2, target:Self.self, selector: #selector(updateUI), userInfo: nil, repeats:false)
  }
  
  @objc func updateUI(){
    lueblQ1.text = questionBan.getQuestionTex()
    one.setTitle(questionBan.getAnswers(index: 0), for: .normal)
    two.setTitle(questionBan.getAnswers(index: 1), for: .normal)
    three.setTitle(questionBan.getAnswers(index: 2), for: .normal)
    fowr.setTitle(questionBan.getAnswers(index: 3), for: .normal)
    progressBar.progress = questionBan.getProgreess()
    valueScoreLabel.text = "\(questionBan.getScore())"
    one.backgroundColor = UIColor .black
    two.backgroundColor = UIColor .black
    three.backgroundColor = UIColor .black
    fowr.backgroundColor = UIColor .black
    
}




}






