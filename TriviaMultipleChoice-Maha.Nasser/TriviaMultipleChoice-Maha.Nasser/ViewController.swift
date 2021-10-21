//
//  ViewController.swift
//  TriviaMultipleChoice-Maha.Nasser
//
//  Created by Maha S on 21/10/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreVlue: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var lastButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    var currentProgress : Int = 0
    var quiz  = Quiz()
    var score: Int = 0
    var player : AVAudioPlayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        scoreLabel.text = "Score : \(score))"
        updateScreen()
        
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        quiz.getNextQuestion()
        let selectedValue = sender.currentTitle!
        let isCorrect = quiz.getAnswer(selectedValue)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3,
                                      execute: {
                                        sender.backgroundColor = UIColor.clear
                                      })
        updateScreen()
    }
    
    
    func updateScreen() {
        
        progressBar.progress = quiz.getProgress(){
            
            if quiz.questionNumber < quiz.questions.count {
                questionLabel.text = quiz.getQuestion()
            }
            scoreLabel.text = "Score : \(quiz.getScore())"
            
        }
        
        func configureButtons() {
            
            firstButton.layer.cornerRadius = 20
            firstButton.layer.borderWidth = 3
            firstButton.layer.borderColor = UIColor.black.cgColor
            
            secondButton.layer.cornerRadius = 20
            secondButton.layer.borderWidth = 3
            secondButton.layer.borderColor = UIColor.black.cgColor
            
            thirdButton.layer.cornerRadius = 20
            thirdButton.layer.borderWidth = 3
            thirdButton.layer.borderColor = UIColor.black.cgColor
            
            lastButton.layer.cornerRadius = 20
            lastButton.layer.borderWidth = 3
            lastButton.layer.borderColor = UIColor.black.cgColor
            
            configureButtons()
        }
        
        
        func showAlertView(){
            
            let alert = UIAlertController(title: "Game Over", message: "Play again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in
                print("Yes")
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            playSound()
        }
        
        var player: AVAudioPlayer?
        
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
            
            
            func stopSound() {
                player?.stop()
            }
            
            
            
        }
    }
}
