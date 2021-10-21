
import UIKit
import AVFoundation
class ViewController: UIViewController {
  
  var player : AVAudioPlayer?
  
  //topView
  @IBOutlet weak var score: UILabel!
  @IBOutlet weak var scoreValue: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  //Butoon
  @IBOutlet weak var firstButton: UIButton!
  @IBOutlet weak var socendButto: UIButton!
  @IBOutlet weak var thirdButton: UIButton!
  @IBOutlet weak var furthButton: UIButton!
  //progress
  
  @IBOutlet weak var progress: UIProgressView!
  
  
  var currenrQuastion:QuastionBank = QuastionBank()
  
 
  var scor = 0

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    updatecounter()
    //Progress.progress = 0.0
    
    // Do any additional setup after loading the view.
    
    //scorelavel
    score.layer.cornerRadius = 10
    score.layer.borderWidth = 3
    score.layer.borderColor = UIColor.white.cgColor
    //quiestion
    questionLabel.layer.cornerRadius = 10
    questionLabel.layer.borderWidth = 3
    questionLabel.layer.borderColor = UIColor.white.cgColor
    //Buttons
    //#1
    firstButton.layer.cornerRadius = 10
    firstButton.layer.borderWidth = 3
    firstButton.layer.borderColor = UIColor.white.cgColor
    
    //#2
    socendButto.layer.cornerRadius = 10
    socendButto.layer.borderWidth = 3
    socendButto.layer.borderColor = UIColor.white.cgColor
    //#3
    thirdButton.layer.cornerRadius = 10
    thirdButton.layer.borderWidth = 3
    thirdButton.layer.borderColor = UIColor.white.cgColor
    //#4
    
    furthButton.layer.cornerRadius = 10
    furthButton.layer.borderWidth = 3
    furthButton.layer.borderColor = UIColor.white.cgColor
    
    score.text = " score \(currenrQuastion.checkScore())"
    updatecounter()
//    updateUI()
  }
  
  
  @IBAction func Buttons(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    let check = currenrQuastion.checkAnswer(userAnswer)
    
    
    if check{
      sender.backgroundColor = UIColor.green;
    }
    else {
      sender.backgroundColor = UIColor.red;
    }
    
    
    
    Timer.scheduledTimer(timeInterval:0.2,
                         target: self,
                         selector: #selector(updatecounter),
                         userInfo: nil,
                         repeats: false)
    
  }
  @objc func updatecounter(){
    questionLabel.text = currenrQuastion.getQuestions()
    print("the current question is \(currenrQuastion.getQuestions())")
    progress.progress = currenrQuastion.checkProgress()
    score.text = "scor: \(currenrQuastion.checkScore())"
    
    firstButton.backgroundColor = UIColor.clear
    socendButto.backgroundColor = UIColor.clear
    thirdButton.backgroundColor = UIColor.clear
    furthButton.backgroundColor = UIColor.clear
    
    
    
  }
  
  
  func startGame (action : UIAlertAction! = nil)
  {
    print (#function)
    currenrQuastion.startGame()
    stopSound()
    
  }
  
  func showGameOverAleartMessage(){
    let ac = UIAlertController(
      title: "GAME OVER", message: "YOUR SCORE IS \(currenrQuastion.checkScore())", preferredStyle: .alert)
    
    ac.addAction(UIAlertAction(title: "play again", style: .default, handler: startGame))
    
    present(ac,animated: true)
  }
  
  
  func playSound() {
    
    
    guard let url = Bundle.main.url(forResource: "win", withExtension: "mp3") else { return }
    
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
  func stopSound(){
    player?.stop()
  }
  
//  func updateUI(){
//    //questionLabel.text = currenrQuastion.getQuestions()
//    if currenrQuastion.questionNumber == 0 {
//      questionLabel.text = "\(currenrQuastion.nextQuestion())"
//      print("the current question is \(currenrQuastion.nextQuestion())")
//      
//    }
//    
//    
//    progress.progress = currenrQuastion.checkProgress()
//    score.text = "scor: \(currenrQuastion.checkScore())"
//  }
//  
  
}
