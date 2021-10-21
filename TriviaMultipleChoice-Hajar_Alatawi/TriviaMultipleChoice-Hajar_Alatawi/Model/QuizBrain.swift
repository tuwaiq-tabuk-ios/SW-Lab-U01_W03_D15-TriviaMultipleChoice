

import Foundation

struct QuizBrain {
  
  var questionNumber = 0
  var score = 0
  
  let questions = [
    Question ( question: "Which is the world's tallest peak?",
               answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
               correctAnswer: "Everest"),
    
    Question ( question: "Which is the Capital of Australia?",
               answers : ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"],
               correctAnswer : "Canberra"),
    
    Question ( question: "Rigoletto opera was composed by ",
               answers: ["Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi", "Richard Wagner"],
               correctAnswer: "Giuseppe Verdi"),
    
    Question ( question: "Turandot opera was composed by",
               answers: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"],
               correctAnswer: "Giacomo Puccini"),
    
    Question ( question: "The magic flute opera was composed by ",
               answers: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"],
               correctAnswer: "Wolfgang Amadeus Mozart")
  ]
  
  mutating func getTheAnswer (_ selectedAnswer : String) -> Bool {
    
    if selectedAnswer == questions[questionNumber].correctAnswer{
      score += 5
      return true
    } else {
      return false
    }
  }
  
  
  func getTheQuestion() -> String {
    return questions[questionNumber].question
    
  }
  
  
  func getAnswers() -> [String]{
    return questions[questionNumber].answers
  }
  
  
  
  func getTheProgress() -> Float {
    return Float(questionNumber) / Float(questions.count)
  }
  
  
  mutating func nextQuestion () -> Bool {
    
    if questionNumber <= questions.count {
      questionNumber += 1
      return true
    } else {
      questionNumber = 0
      score = 0
      return false
    }
  }
  
  func getTheScore () -> Int{
    return score
  }
  
  
}
