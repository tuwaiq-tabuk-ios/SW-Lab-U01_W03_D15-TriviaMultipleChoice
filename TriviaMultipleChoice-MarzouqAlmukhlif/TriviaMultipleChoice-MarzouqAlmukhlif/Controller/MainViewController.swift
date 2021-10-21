//
//  MainViewController.swift
//  TriviaMultipleChoice-MarzouqAlmukhlif
//
//  Created by Marzouq Almukhlif on 15/03/1443 AH.
//

import UIKit

class MainViewController: UIViewController {
  @IBOutlet weak var valueHighestScore: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      if UserDefaults.standard.object(forKey: "HighestScore") == nil{
        UserDefaults.standard.setValue(0, forKey: "HighestScore")
      }
      valueHighestScore.text = "\(UserDefaults.standard.integer(forKey: "HighestScore"))"
      
    }
    
  
  @IBAction func playButtonPressed(_ sender: Any) {
    if (UserDefaults.standard.integer(forKey: "qusetionNumber") != 0) {
      performSegue(withIdentifier: "alertView", sender: self)
    }else{
      performSegue(withIdentifier: "questionView", sender: self)
    }
  }
  
  
  @IBAction func openTwitter(_ sender: Any) {
    if let url = URL(string: "https://twitter.com/mhster_nice") {
        UIApplication.shared.open(url)
    }
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
