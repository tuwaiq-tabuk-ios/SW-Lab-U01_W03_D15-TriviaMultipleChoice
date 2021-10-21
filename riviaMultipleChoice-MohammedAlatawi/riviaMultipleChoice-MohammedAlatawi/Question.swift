//
//  Question.swift
//  riviaMultipleChoice-MohammedAlatawi
//
//  Created by محمد العطوي on 15/03/1443 AH.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    
    init(questions:String ,choice:[String], correct:String) {
        self.question = questions
        self.answers = choice
        self.correctAnswer = correct
    }
}
