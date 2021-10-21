//
//  question .swift
//  TriviaMultipleChoice
//
//  Created by Yousef Albalawi on 15/03/1443 AH.
//

import Foundation
struct Question {
  let question : String
  let answers : [String]
  let corectAnswers : String

init(question : String, answers: [String] , corectAnswers:String) {
    self.question = question
    self.answers = answers
    self.corectAnswers = corectAnswers
  }
}
