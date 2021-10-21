//
//  QuestionManager.swift
//  TriviaMultipleChoice"Dana"
//
//  Created by macbook air on 15/3/1443 AH.
//

import Foundation
struct QuizManager {
  
  let quiz = [
    Question(question: "Rome is located in ?", choices: ["Germany", "Farnce", "Saudi", "Italy"], answer: "Italy"),
    Question(question: "Riyadh capital of ", choices: ["Germany", "Farnce","Saudi","Italy"], answer: "Saudi"),
    Question(question: "Paris capital of ?", choices: ["Germany", "Farnce","Saudi","Italy"], answer: "Farnce"),
    Question(question: "currency of Saudi is ?", choices: ["Riyal", "Dollar","Euro","Pound"], answer: "Riyal"),
    Question(question: "The language of Saudi Arabia is ?", choices: ["English", "Arabic","Greek","Hindi"], answer: "Arabic")]
  
  private var questionNumber = 0
  var score = 0
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    print(userAnswer)
    print(quiz[questionNumber].answer)
    if userAnswer == quiz[questionNumber].answer{
      score += 5
      return true
    }
    score -= 5
    return false
  }
  func checkQuestion() -> String {
    return quiz[questionNumber].question
  }
  func checkChoices() -> [String] {
    return quiz[questionNumber].choices
  }
  func checkProgress() -> Float {
    return Float(questionNumber) / Float(quiz.count);
  }
  func checkScore() -> Int {
    return score
  }
  
  mutating func nextQuestion() -> Bool {
    //questionNumber += 1
    if (questionNumber + 1 < quiz.count){
      questionNumber += 1
      //  questionNumber = 0
      //   score = 0
      return true
    }
    else{
      return false
    }
  }
  
  
  mutating func start() {
    questionNumber = 0
    score = 0
  }
}
