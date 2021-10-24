
import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var currentQuestionNumber = 0
    let successedScore = 5
    let failedScore = -10
    let op = Operation()
    var player : AVAudioPlayer?
    @IBOutlet weak var valueScoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionFirstButton: UIButton!
    @IBOutlet weak var optionSecondButton: UIButton!
    @IBOutlet weak var optionThirdButton: UIButton!
    @IBOutlet weak var optionFourthButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       FillNextQuestion()
        
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
                
                self.hasUserGoodScore(currentScore: Int(score)!)
                let alert = UIAlertController(title: "GAME OVER",message: "Your score is \(String(Int(score)!))",preferredStyle: .alert )
                alert.addAction(UIAlertAction(title: "play again", style: .default, handler: {
                    action in
                    self.currentQuestionNumber = 0
                    self.FillNextQuestion()
                    self.progressView.progress = 0.0
                    self.valueScoreLabel.text = "0"
                    self.stopSound()
                }))
                
                
                self.present(alert, animated: true)
            }
        }
       
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
    
    func hasUserGoodScore(currentScore : Int)
    {
        let maxScore = op.Question.count * successedScore
        
        let percentageScore : Double = Double(currentScore) / Double(maxScore)
        if percentageScore >= 0.7
        {
            playSound(isSuccessed: true)
        }else{
            playSound(isSuccessed: false)
        }
    }
    
    func playSound(isSuccessed : Bool)
    {
        var url : URL
        if isSuccessed
        {
            url = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        }else
        {
            url = Bundle.main.url(forResource: "sound2", withExtension: "mp3")!
            
        }
           
            
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
        
        
   
    
}

