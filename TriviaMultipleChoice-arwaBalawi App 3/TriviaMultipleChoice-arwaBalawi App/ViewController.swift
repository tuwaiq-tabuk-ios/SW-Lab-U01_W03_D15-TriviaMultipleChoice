
import UIKit

class ViewController: UIViewController {
    
    var currentQuestionNumber = 0
   
    let utl = Utility()
    let op = Operation()
    let successedScore = 5
    let failedScore = -10
    @IBOutlet weak var valueScoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionFirstButton: UIButton!
    @IBOutlet weak var optionSecondButton: UIButton!
    @IBOutlet weak var optionThirdButton: UIButton!
    @IBOutlet weak var optionFourthButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        utl.ButtonDecoration(btn: optionFirstButton)
        utl.ButtonDecoration(btn: optionSecondButton)
        utl.ButtonDecoration(btn: optionThirdButton)
        utl.ButtonDecoration(btn: optionFourthButton)
       FillNextQuestion()
        
    }
    func FillNextQuestion()
    {
      
        questionLabel.text = op.Question[currentQuestionNumber].question
        optionFirstButton.setTitle(op.Question[currentQuestionNumber].answers[0], for: .normal)
        optionSecondButton.setTitle(op.Question[currentQuestionNumber].answers[1], for: .normal)
        optionThirdButton.setTitle(op.Question[currentQuestionNumber].answers[2], for: .normal)
        optionFourthButton.setTitle(op.Question[currentQuestionNumber].answers[3], for: .normal)
        optionFirstButton.backgroundColor = UIColor.lightGray
        optionSecondButton.backgroundColor = UIColor.lightGray
        optionThirdButton.backgroundColor = UIColor.lightGray
        optionFourthButton.backgroundColor = UIColor.lightGray
    }
    
   
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        var score : String =  valueScoreLabel.text!
        let seconds = 2.0
       
        if sender.currentTitle == op.Question[currentQuestionNumber].correctAnswer
        {
            sender.backgroundColor = UIColor.green
            valueScoreLabel.text = String(Int(score)! + successedScore)
            
            
        }else
        {
            sender.backgroundColor = UIColor.red
            valueScoreLabel.text = String(Int(score)! + failedScore)
        }
       
   
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            score = self.valueScoreLabel.text!
            self.progressView.progress += 0.2
            if self.currentQuestionNumber < 4
            {
                self.currentQuestionNumber += 1
                self.FillNextQuestion()
            }else{
                
                self.op.hasUserGoodScore(currentScore: Int(score)!)
                let alert = UIAlertController(title: "GAME OVER",message: "Your score is \(String(Int(score)!))",preferredStyle: .alert )
                alert.addAction(UIAlertAction(title: "play again", style: .default, handler: { [self]
                    action in
                    self.currentQuestionNumber = 0
                    self.FillNextQuestion()
                    self.progressView.progress = 0.0
                    self.valueScoreLabel.text = "0"
                    self.op.stopSound()
                }))
                
                
                self.present(alert, animated: true)
            }
        }
       
    }
    
    
   
    
   
        
   
    
}

