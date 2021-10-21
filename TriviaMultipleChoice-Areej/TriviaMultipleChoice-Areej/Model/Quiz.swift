//
//  Quiz.swift
//  TriviaMultipleChoice-Areej
//
//  Created by A A on 15/03/1443 AH.
//

import Foundation

struct Quiz {
  
  var questionNumber : Int = 0
  var score : Int = 0
  
  
  let questions = [
    Questions (question: "Which is the world's tallest peak?", answers: ["Klimanjaro","Everest","Jabel Sawda","Montblanc"], correctAnswer: "Everest"),
    
    Questions (question: "Which is the Capital of Australia?", answers: ["Canberra","Sydeny","Melbourne","Australia does not have a capital"], correctAnswer: "Canberra"),
    
    Questions (question: "Which is the Capital of Turkey?", answers: ["Ankara","Istanbul","Izmir","Bursa"], correctAnswer: "Istanbul"),
    
    Questions (question: "Which is the Capital of Saudi Arabia?", answers: ["Jeddah","Tabuk","Riyadh","Abha"], correctAnswer: "Riyadh"),
    
    Questions (question: "Which is the Capital of Qatar?", answers: ["Doha","Abu az Zuluf","Al Arish","Al Ghanim"], correctAnswer: "Doha")
  ]
  
  
  mutating func getAnswer (_ selectedAnswer : String) -> Bool{
    let questionAnswer = questions[questionNumber].correctAnswer
    if selectedAnswer == questionAnswer {
      score += 1
      return true
    } else {
      return false
    }
  }
  
  
  func getQuestion() -> String{
    return questions[questionNumber].question
  }
  
  
  func getProgress() -> Float {
    return Float (questionNumber + 1) / Float(questions.count)
  }
  
  
  mutating func getNextQuestion(){
    if questionNumber + 1 < questions.count{
      questionNumber += 1
    } else {
      questionNumber = 0
      score = 0
    }
  }
  
  
  func getScore() -> Int{
    return score
  }
  
}
