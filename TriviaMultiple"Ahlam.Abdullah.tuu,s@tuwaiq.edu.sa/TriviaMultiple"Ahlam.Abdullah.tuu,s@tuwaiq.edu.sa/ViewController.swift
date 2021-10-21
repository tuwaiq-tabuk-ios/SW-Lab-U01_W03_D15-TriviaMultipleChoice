//
//  ViewController.swift
//  TriviaMultiple"Ahlam.Abdullah.tuu,s@tuwaiq.edu.sa
//
//  Created by ahlam  on 15/03/1443 AH.
//

import UIKit
import AVFoundation
class ViewController: UIViewController{
    @IBOutlet weak var scoreValueLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionFirstButton: UIButton!
    
    @IBOutlet weak var optionSecondButton: UIButton!
    
    @IBOutlet weak var optionThirdButton: UIButton!
    
    @IBOutlet weak var optionFourthButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    

    var currentQuestionIndex = 0
    var secondsRemaining = 5
    var timer: Timer = Timer()
    var score = 0
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButons()
        progressView.progress = Float((currentQuestionIndex + 1) / (questions.count))
        showQuestions()
    }
    
    private func configureButons() {
        optionFirstButton.clipsToBounds = true
        optionFirstButton.layer.cornerRadius = 25
        optionFirstButton.layer.borderWidth = 3
        optionFirstButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionFirstButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionFirstButton.titleLabel?.minimumScaleFactor = 0.5
        
        optionSecondButton.clipsToBounds = true
        optionSecondButton.layer.cornerRadius = 25
        optionSecondButton.layer.borderWidth = 3
        optionSecondButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionSecondButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionSecondButton.titleLabel?.minimumScaleFactor = 0.5
        
        optionThirdButton.clipsToBounds = true
        optionThirdButton.layer.cornerRadius = 25
        optionThirdButton.layer.borderWidth = 3
        optionThirdButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionThirdButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionThirdButton.titleLabel?.minimumScaleFactor = 0.5
        
        optionFourthButton.clipsToBounds = true
        optionFourthButton.layer.cornerRadius = 25
        optionFourthButton.layer.borderWidth = 3
        optionFourthButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        optionFourthButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionFourthButton.titleLabel?.minimumScaleFactor = 0.5
    }
    
    private func showQuestions() {
        optionFirstButton.backgroundColor = .clear
        optionSecondButton.backgroundColor = .clear
        optionThirdButton.backgroundColor = .clear
        optionFourthButton.backgroundColor = .clear
        let percentageProgress = Float(currentQuestionIndex) / Float(questions.count)
        progressView.progress = Float(percentageProgress)
        
        if currentQuestionIndex <= questions.count - 1 {
            print(currentQuestionIndex)
            
            questionLabel.text = questions[currentQuestionIndex].question
            
            optionFirstButton.setTitle(questions[currentQuestionIndex].answers[0], for: .normal)
            optionSecondButton.setTitle(questions[currentQuestionIndex].answers[1], for: .normal)
            optionThirdButton.setTitle(questions[currentQuestionIndex].answers[2], for: .normal)
            optionFourthButton.setTitle(questions[currentQuestionIndex].answers[3], for: .normal)
        } else {
            showAlert()
        }
        
    }
    
    private func startTimer() {
        self.secondsRemaining = 5
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("Seconds Remaining = \(secondsRemaining)")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            currentQuestionIndex += 1
            showQuestions()
        }
    }
    
    private func updateScore(userAnswer: String, sender: UIButton) {
        if userAnswer == questions[currentQuestionIndex].correctAnswer {
            score += 5
            sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            scoreValueLabel.text = "\(score)"
        } else {
            score -= 10
            sender.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            scoreValueLabel.text = "\(score)"
        }
    }
    
    private func showAlert() {
        hasUserGoodScore()
        
        // create the alert
        let alert = UIAlertController(title: "GAME OVER", message: "Your score is \(score)", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (_) in
            self.currentQuestionIndex = 0
            self.score = 0
            self.scoreValueLabel.text = "\(self.score)"
            self.showQuestions()
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    private func playSound() {
        guard let path = Bundle.main.path(forResource: "Clapping Sound Effects - Applause - Audience - Crowd Sound Effect (128  kbps) (shabakngy.com)", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func hasUserGoodScore() {
        let maxScore = questions.count * 5
        if Float(score) / Float(maxScore) >= 0.75 {
            playSound()
        }
    }
    
    @IBAction func answerButtonDidPressed(_ sender: UIButton) {
        startTimer()
        
        if currentQuestionIndex < questions.count - 1 {
            updateScore(userAnswer: sender.currentTitle!, sender: sender)
        } else if currentQuestionIndex == questions.count - 1{
            updateScore(userAnswer: sender.currentTitle!, sender: sender)
        }
    }
    
}
