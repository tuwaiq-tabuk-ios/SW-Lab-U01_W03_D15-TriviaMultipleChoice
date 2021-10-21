//
//  AlertViewController.swift
//  TrivialStingChoice
//
//  Created by Marzoog Almoklif on 14/03/1443 AH.
//

import UIKit

var rest:Bool = false
class AlertViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  @IBAction func buttonCliked(_ sender: UIButton) {
    if sender.tag == 1 {
      continueAction()
    }else{
      restartAction()
    }
  }
  
  
  func restartAction(){
    UserDefaults.standard.set(0, forKey: "qusetionNumber")
    UserDefaults.standard.set(0, forKey: "score")
    performSegue(withIdentifier: "passToQuestionView", sender: self)
    
  }
  
   func continueAction() {
    performSegue(withIdentifier: "passToQuestionView", sender: self)
  }
  
}
