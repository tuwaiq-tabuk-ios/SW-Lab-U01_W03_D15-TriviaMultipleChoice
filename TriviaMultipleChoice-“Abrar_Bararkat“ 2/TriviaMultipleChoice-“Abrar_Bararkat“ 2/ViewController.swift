//
//  ViewController.swift
//  TriviaMultipleChoice-“Abrar_Bararkat“ 2
//
//  Created by ABRAR ALQARNI on 15/03/1443 AH.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    @IBOutlet weak var valueScore: UILabel!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var choice4: UIButton!
    
    
    @IBOutlet weak var progress: UIProgressView!
    
    var quizManager = QuizManager()
    var change = 1
    var player: AVAudioPlayer?

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        QuestionLabel.layer.cornerRadius = 30
        QuestionLabel.layer.borderWidth = 3
        QuestionLabel.layer.masksToBounds = true
        
        choice1.layer.cornerRadius = 30
        choice1.layer.borderWidth = 3
        choice1.layer.masksToBounds = true
        
        
        choice2.layer.cornerRadius = 30
        choice2.layer.borderWidth = 4
        choice2.layer.masksToBounds = true
        
        
        
        choice3.layer.cornerRadius = 30
        choice3.layer.borderWidth = 4
        choice3.layer.masksToBounds = true
        
        choice4.layer.cornerRadius = 30
        choice4.layer.borderWidth = 4
        choice4.layer.masksToBounds = true
        
        updateUI()
        progress.progress = 0.0
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let check = quizManager.checkAnswer(userAnswer)
        if check{
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    if quizManager.nextQuestion() {
        
    }else {
        showAlertView1()
        
    }
    }
  
    @objc func updateUI(){
        QuestionLabel.text = quizManager.checkQuestion()
        progress.progress = quizManager.checkProgress()
        valueScore.text = " \(quizManager.checkScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        choice4.backgroundColor = UIColor.clear
        
        
        
        
        choice1.setTitle(quizManager.checkChoices()[0], for: .normal)
        choice2.setTitle(quizManager.checkChoices()[1], for: .normal)
        choice3.setTitle(quizManager.checkChoices()[2], for: .normal)
        choice4.setTitle(quizManager.checkChoices()[3], for: .normal)
        
    }
    
    
    func showAlertView1(){
        let alert = UIAlertController(title: "End game", message: "play agine?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in
          print("Yes clicked")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        playSound()
      }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "clap", withExtension: "wav") else { return }

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
