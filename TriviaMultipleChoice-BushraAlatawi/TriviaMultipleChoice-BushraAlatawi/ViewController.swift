//
//  ViewController.swift
//  TriviaMultipleChoice-BushraAlatawi
//
//  Created by bushra nazal alatwi on 15/03/1443 AH.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueScoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionFirstButton: UIButton!
    @IBOutlet weak var optionSecondButton: UIButton!
    @IBOutlet weak var optionThirdButton: UIButton!
    @IBOutlet weak var optionFourthButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let questions = [
        MultipleChoiceQuestion(question: "Which is the world's tallest peak?", answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"], correctAnswer: "Everest"),
        
        MultipleChoiceQuestion(question: "Rigoletto opera was composed by", answers: ["Giacomo Puccini", "Wolfgang Amadeus Mozart","Giuseppe Verdi", "Richard Wagner"], correctAnswer: "Giuseppe Verdi"),
        
        MultipleChoiceQuestion(question: "Which is the Capital of Australia?", answers: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"], correctAnswer: "Canberra"),
        
        MultipleChoiceQuestion (question: "Turandot opera was composed by",answers: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"], correctAnswer: "Giacomo Puccini"),
        
        MultipleChoiceQuestion(question: "The magic flute opera was composed by",answers: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"], correctAnswer: "Wolfgang Amadeus Mozart")
    ]
    var player: AVAudioPlayer!
    var timer: Timer!
    var currentQuestionIndex = 0
    var secondsRemaining = 5
    var score = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButons()
        progressBar.progress = Float((currentQuestionIndex + 1) / (questions.count))
        showQuestions()
    }
    
    func configureButons() {
        optionFirstButton.layer.cornerRadius = 30
        optionFirstButton.layer.borderWidth = 3
        optionFirstButton.layer.borderColor = UIColor.black.cgColor
        
        optionSecondButton.layer.cornerRadius = 30
        optionSecondButton.layer.borderWidth = 3
        optionSecondButton.layer.borderColor = UIColor.black.cgColor
        
        optionThirdButton.layer.cornerRadius = 30
        optionThirdButton.layer.borderWidth = 3
        optionThirdButton.layer.borderColor = UIColor.black.cgColor
       
        optionFourthButton.layer.cornerRadius = 30
        optionFourthButton.layer.borderWidth = 3
        optionFourthButton.layer.borderColor = UIColor.black.cgColor
    }
    
   func showQuestions() {
        optionFirstButton.backgroundColor = .clear
        optionSecondButton.backgroundColor = .clear
        optionThirdButton.backgroundColor = .clear
        optionFourthButton.backgroundColor = .clear
    
        let percentageProgress = Float(currentQuestionIndex) / Float(questions.count)
        progressBar.progress = Float(percentageProgress)
        
        if currentQuestionIndex <= questions.count - 1 {
            print(currentQuestionIndex)
            
            questionLabel.text = questions[currentQuestionIndex].question
            
            optionFirstButton.setTitle(questions[currentQuestionIndex].answers[0], for: .normal)
            optionSecondButton.setTitle(questions[currentQuestionIndex].answers[1], for: .normal)
            optionThirdButton.setTitle(questions[currentQuestionIndex].answers[2], for: .normal)
            optionFourthButton.setTitle(questions[currentQuestionIndex].answers[3], for: .normal)
        } else {
            showGameOverAlertMessage()
        }

    }
    
   func start() {
        self.secondsRemaining = 5
        self.timer = Timer.scheduledTimer(timeInterval: 1.0,
                                          target: self,
                                          selector: #selector(updateTimer),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("Seconds = \(secondsRemaining)")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            currentQuestionIndex += 1
            showQuestions()
        }
    }
    
    func updateQuestion(userAnswer: String, sender: UIButton) {
        if userAnswer == questions[currentQuestionIndex].correctAnswer {
            score += 5
            sender.backgroundColor = UIColor.green
            valueScoreLabel.text = "\(score)"
        } else {
            score -= 10
            sender.backgroundColor = UIColor.red
            valueScoreLabel.text = "\(score)"
        }
    }
    
     func showGameOverAlertMessage() {
        hasUserGoodScore()
    
        let alert = UIAlertController(title: "GAME OVER", message: "Your Score is \(score)", preferredStyle: UIAlertController.Style.alert)
    
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (_) in
            self.currentQuestionIndex = 0
            self.score = 0
            self.valueScoreLabel.text = "\(self.score)"
            self.showQuestions()
        }))
      
        self.present(alert, animated: true, completion: nil)
    }
    
  func playSound() {
        guard let path = Bundle.main.path(forResource: "clap", ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
   func hasUserGoodScore() {
        let score = questions.count * 5
        if Float(score) / Float(score) >= 0.75 {
            playSound()
        }
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    start()
        if currentQuestionIndex < questions.count - 1 {
            updateQuestion(userAnswer: sender.currentTitle!, sender: sender)
        } else if currentQuestionIndex == questions.count - 1{
            updateQuestion(userAnswer: sender.currentTitle!, sender: sender)
        }
    }
}
     
      

