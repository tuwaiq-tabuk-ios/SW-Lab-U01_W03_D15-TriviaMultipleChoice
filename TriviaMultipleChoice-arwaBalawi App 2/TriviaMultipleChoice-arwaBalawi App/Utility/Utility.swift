//
//  Utility.swift
//  TriviaMultipleChoice-arwaBalawi App
//
//  Created by Mahmoud Fayez on 18/03/1443 AH.
//

import Foundation
import UIKit

class Utility
{
    
    func ButtonDecoration(btn : UIButton)
    {
     
        btn.layer.cornerRadius = 8
        btn.layer.shadowColor = UIColor(named: "buttonShadow")?.cgColor
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.white.cgColor
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
   
}
