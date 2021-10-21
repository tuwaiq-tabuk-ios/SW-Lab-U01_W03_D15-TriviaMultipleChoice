//
//  Questions.swift
//  TriviaMultipleChoice-Areej
//
//  Created by A A on 15/03/1443 AH.
//

import Foundation

struct Questions {
  
  let question : String
  let answers : [String]
  let correctAnswer : String
  
  
  func getQuestion () -> String{
    return self.question
  }
  
  
  func getAnswer() -> [String] {
    return self.answers
  }
  
  
  func getCorrectAnswer() -> String{
    return self.correctAnswer
  }
  
}
