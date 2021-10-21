import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  
  
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  
  
  @IBOutlet weak var optionFirstLabel: UIButton!
  @IBOutlet weak var optionSecondLabel: UIButton!
  @IBOutlet weak var optionThirdLabel: UIButton!
  @IBOutlet weak var optionFourthLabel: UIButton!
  
  
  @IBOutlet weak var optionFirstButton: UIView!
  @IBOutlet weak var optionSecondButton: UIView!
  @IBOutlet weak var optionThirdButton: UIView!
  @IBOutlet weak var optionFourthButton: UIView!
  
  @IBOutlet weak var progressBar: UIProgressView!
  
  
  var allQuestions:QuestionBank = QuestionBank()
  var player: AVAudioPlayer?
  var score = 0
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    roundCorner ()
    
    updateQuestion()
  }
  
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    let userAnser = sender.titleLabel?.text
    // print("line 66 \(userAnser)")
    guard let userAnser = sender.currentTitle else {
      print("ERROR")
      return
    }
    let isRightAnswer = allQuestions.isAnswerCorrect(userAnswer: userAnser)
    
    if isRightAnswer {
      sender.backgroundColor = .systemGreen
      
    }else{
      sender.backgroundColor = .systemRed
    }
    if allQuestions.nextQuestion(){
      Timer.scheduledTimer(timeInterval: 0.5,
                           target: self,
                           selector:#selector(updateQuestion),
                           userInfo: nil,
                           repeats: false)
      
    }else{
      showGameOverMessage()
    }
  }
  
  
  func showGameOverMessage(){
    let ab = UIAlertController(title:"GAME OVER!", message: "You have achieved \(allQuestions.getScore()) Score", preferredStyle: .alert)
    ab.addAction(UIAlertAction(title:"Play again",
                               style:.default,
                               handler:startGameAgain))
    
    present(ab, animated: true)
  }
  
  
  @objc func updateQuestion() {
    if allQuestions.qustionNumber <= allQuestions.questionList.count{
      progressBar.setProgress(Float(allQuestions.getProgress()), animated: false)
      questionLabel.text = allQuestions.getQuestion()
      scoreLabel.text = "Score \(allQuestions.getScore())"
      optionFirstLabel.backgroundColor = UIColor.clear
      optionSecondLabel.backgroundColor = UIColor.clear
      optionThirdLabel.backgroundColor = UIColor.clear
      optionFourthLabel.backgroundColor = UIColor.clear
      optionFirstLabel.setTitle(allQuestions.getChoices()[0], for: .normal)
      optionSecondLabel.setTitle(allQuestions.getChoices()[1], for: .normal)
      optionThirdLabel.setTitle(allQuestions.getChoices()[2], for: .normal)
      optionFourthLabel.setTitle(allQuestions.getChoices()[3], for: .normal)
      optionFirstButton.accessibilityIdentifier = allQuestions.getChoices()[0]
      optionSecondButton.accessibilityIdentifier = allQuestions.getChoices()[1]
      optionThirdButton.accessibilityIdentifier = allQuestions.getChoices()[2]
      optionFourthButton.accessibilityIdentifier = allQuestions.getChoices()[3]
      hasUserGoodScore()
     
    }
  }
  
  
  func hasUserGoodScore(){
    let totalCorrectAnswer = 25
    let percentage = 70 / 100
    
    let finalScore = totalCorrectAnswer * percentage
    
    if allQuestions.getScore() > finalScore{
      playSound(soundName: "clap")
    }
  }
  
  func roundCorner (){
    optionFirstLabel.backgroundColor = .clear
    optionFirstLabel.layer.cornerRadius = 40
    optionFirstLabel.layer.borderWidth = 3
    optionFirstLabel.layer.borderColor = UIColor.blue.cgColor
    
    optionSecondLabel.backgroundColor = .clear
    optionSecondLabel.layer.cornerRadius = 40
    optionSecondLabel.layer.borderWidth = 3
    optionSecondLabel.layer.borderColor = UIColor.blue.cgColor
    
    optionThirdLabel.backgroundColor = .clear
    optionThirdLabel.layer.cornerRadius = 40
    optionThirdLabel.layer.borderWidth = 3
    optionThirdLabel.layer.borderColor = UIColor.blue.cgColor
    
    optionFourthLabel.backgroundColor = .clear
    optionFourthLabel.layer.cornerRadius = 40
    optionFourthLabel.layer.borderWidth = 3
    optionFourthLabel.layer.borderColor = UIColor.blue.cgColor
  }
  
  
  func startGameAgain(action:UIAlertAction! = nil){
    allQuestions.startGame()
    updateQuestion()
  }
  
  
  func playSound(soundName: String) {
    guard let url = Bundle.main.url(forResource: soundName , withExtension: "wav")
    else { return
      
    }
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      guard let player = player else {
        return
      }
      player.play()
      
    } catch let error {
      print("ERROR: The audio does not work.\n \(error.localizedDescription)")
    }
  }
  
  
  func stopSound() {
    player?.stop()
  }
  
  
  
  
  
}

