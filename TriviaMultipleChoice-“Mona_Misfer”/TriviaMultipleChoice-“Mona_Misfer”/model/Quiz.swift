//
//  Question.swift
//  TriviaMultipleChoice-“Mona_Misfer”
//
//  Created by mona M on 21/10/2021.
//

import Foundation
struct Quiz {
var questionNumber = 0
var score = 0

let questions = [
  
  Question  (question: "Which is the world's tallest peak?",   answer : "False"),
  Question (question: "Which is Capital of Australia?", answer : "False"),
  Question (question: "Rigoletto opera was composed by", answer : "True"),
  Question (question: "Turandot opera was composed by ", answer : "True"),
  Question (question: "The magic flute opera was compsed by  ", answer : "True"),
  Question (question: "The Manx cat is known for its long and tufted tail?", answer : "False")
]


mutating func getAnswer(_ selectedAnswer : String) -> Bool{
  let questionAnswer = questions[questionNumber].answer
   if selectedAnswer == questionAnswer {
    score += 1
    return true
  }else{
    return false
  }
}


func getQuestion() -> String {
  return questions[questionNumber].question
}


func getProgress() -> Float{
  return Float(questionNumber) / Float(questions.count)
}


mutating func getNextQuestion(){
  if questionNumber  <= questions.count {
    questionNumber += 1
  }else{
    questionNumber = 0
    score = 0
  }
}


func getScore() -> Int{
  
  return score
}
}
