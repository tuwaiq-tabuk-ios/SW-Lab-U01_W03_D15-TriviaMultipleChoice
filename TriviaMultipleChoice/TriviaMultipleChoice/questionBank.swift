//
//  QuestionBank.swift
//  TriviaMultipleChoice
//
//  Created by عبدالعزيز البلوي on 15/03/1443 AH.
// abdulaziz albalawi

import Foundation
struct questionBank {
  
  let question = [Question(
    question: "Which is the world's tallest peak?",
    answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
    correctAnswer: "Everest"
  ),
  Question(
    question: "Which is the Capital of Australia?",
    answers:["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"],
    correctAnswer: "Canberra"
  ),
  Question(
    question: "Rigoletto opera was composed by",
    answers: ["Giacomo Puccini", "Wolfgang Amadeus Mozart",
              "Giuseppe Verdi", "Richard Wagner"],
    correctAnswer: "Giuseppe Verdi"
  ),
  Question(
    question: "Turandot opera was composed by",
    answers: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"],
    correctAnswer: "Giacomo Puccini"
  ),
  Question(
    question: "The magic flute opera was composed by",
    answers: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"],
    correctAnswer: "Wolfgang Amadeus Mozart")
  
  ]
  var questionNumber = 0
  var score = 0
  mutating func nextQ(){
    if questionNumber + 1 < question.count  {
      questionNumber += 1
    }else{
      questionNumber = 0
      score = 0
    }
  }
  func getAnswers(index:Int) -> String {
    return question[questionNumber].answers[index]
  }
  func getQuestionTex() -> String {
    return question[questionNumber].question
  }
  mutating func chekAnswers(_ userAnswer:String)->Bool{
    if userAnswer == question[questionNumber].correctAnswer {
      score += 5
      return true
    }else{
      score -= 10
      return false
    }
  }
  func getProgreess() -> Float {
    let progress = Float(questionNumber) / Float(question.count)
    return progress
  }
  func getScore() -> Int {
    return score
  }
}
