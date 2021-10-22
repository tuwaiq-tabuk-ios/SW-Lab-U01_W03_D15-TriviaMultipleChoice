//
//  QuestionManager.swift
//  TriviaMultipleChoice-Shuruq
//
//  Created by Shorouq AlAnzi on 15/03/1443 AH.
//

import Foundation
struct QuizManager {
  
  var questionNumber = 0
  var score = 0

  private let quiz = [
    Question(question: "Which is the world's tallest peak?",
             answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"], correctAnswer:"Everest"),
    
    Question(question: "Which is the Capital of Australia?",
         answers: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"] ,correctAnswer: "Canberra"),
    
    Question(question: "Rigoletto opera was composed by" ,
             answers: ["Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi", "Richard Wagner"],correctAnswer: "Giuseppe Verdi"),
    
    Question(question: "Turandot opera was composed by",
             answers: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"], correctAnswer: "Giacomo Puccini" ),
    
    Question(question: "The magic flute opera was composed by",
             answers: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"] , correctAnswer: "Wolfgang Amadeus Mozart")]

mutating func checkAnswer(_ userAnswer:String) -> Bool {
  print(userAnswer)
  print(quiz[questionNumber].correctAnswer)
  if userAnswer == quiz[questionNumber].correctAnswer {
    score += 5
    return true
  } else {
    score -= 5 
    return false
  }
}


func getScore() -> Int {
  return score
}

func getQuestion() -> String {

    quiz[questionNumber].question
}
func checkChoices() -> [String] {
  
  return quiz[questionNumber].answers
    }
  
func getQuestionNnmber() -> String {
     
  return quiz[questionNumber].question
}

func getProgress() -> Float {
  
  
Float (questionNumber + 1 ) / Float(quiz.count)
}
  mutating func nextQuestion() -> Bool{
  //print("questionNumber + 1: \(questionNumber + 1)")
  if (questionNumber + 1 <  quiz.count){
    questionNumber += 1
    return true
    
  } else {
  return false
}
    }
 
  mutating func startGame(){
  score = 0
  questionNumber = 0
}
}
