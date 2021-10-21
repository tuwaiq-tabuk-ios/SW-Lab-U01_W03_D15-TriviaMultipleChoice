//
//  Questions.swift
//  TriviMultipleChoice_App
//
//  Created by Mohammed on 15/03/1443 AH.
//

import Foundation


struct Question {
    
    let questionText:String
    let answers:[String]
    let correctAnswer:String
    

    
    init (question: String, answer:[String], rightAnswer: String) {
        questionText = question
        answers = answer
        correctAnswer = rightAnswer
    }
}
