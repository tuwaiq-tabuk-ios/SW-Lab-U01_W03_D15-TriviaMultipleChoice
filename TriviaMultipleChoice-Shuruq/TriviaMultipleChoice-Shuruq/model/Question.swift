//
//  Question.swift
//  TriviaMultipleChoice-Shuruq
//
//  Created by Shorouq AlAnzi on 15/03/1443 AH.
//

import Foundation

struct Question {
  let question: String
  let answers: [String]
  let correctAnswer :String
  
  init(question:String, answers:[String], correctAnswer: String){
    self.question = question
    self.answers = answers
    self.correctAnswer = correctAnswer
      
  }
}
