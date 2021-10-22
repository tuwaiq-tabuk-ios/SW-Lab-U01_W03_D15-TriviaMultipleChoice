//
//  QuestionManager.swift
//  TriviaMultipleChoice"Dana"
//
//  Created by macbook air on 15/3/1443 AH.
//

import Foundation
struct QuizManager {
  
  let quiz = [
    Question(question: "A bee flaps its wings at a rate per second?", choices: ["550times", "250times", "350times", "150times"], answer: "350times"),
    Question(question: "The scientist who invented the telephone is? ", choices: ["Alexander Graham Bell", " Joseph Priestley"," Joseph Priestley","Wilhelm Röntfen"], answer: "Alexander Graham Bell"),
    Question(question: "The largest African country in terms of area is the country ?", choices: ["Algeria", "Mauritania","Egypt","Sudan"], answer: "Sudan"),
    Question(question: "Water that freezes faster when put in the freezer is?", choices: ["cold water", "moderate wate","hot water","all at once"], answer: "hot water"),
    Question(question: "The science of studying the activities and functions of the body’s organs is known as?", choices: ["Biological science ", "Physiological science","Ethiopathic science ","Biomedical science"], answer: "Physiological science")]
  
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
