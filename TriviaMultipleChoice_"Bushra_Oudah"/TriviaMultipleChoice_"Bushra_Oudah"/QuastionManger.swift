
import Foundation
struct QuastionManger {
    
  let quiz = [
    Question(question: "Which is the world's tallest peak?",
             answer: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
             correctAnswer: "Everest"),
    
    
    Question(question: "Which is the Capital of Australia?",
             answer: ["Canberra", "Sydney", "Melbourne", "Australia does nothave a capital"],
             correctAnswer: "Canberra"),
    
    
    Question(question: "Rigoletto opera was composed by?",
             answer: ["Giacomo Puccini", "Wolfgang Amadeus Mozart", "JGiuseppe Verdi", "Richard Wagner"],
             correctAnswer: "Giuseppe Verdi"),
    
    
    Question(question: "The magic flute opera was composed by?",
             answer: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Montblanc"],
             correctAnswer: "Wolfgang Amadeus Mozart"),]
  
 private var questionNumber = 0
  var score = 0
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
      print(userAnswer)
      print(quiz[questionNumber].answer)
      if userAnswer == quiz[questionNumber].correctAnswer{
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
      return quiz[questionNumber].answer
  }
  func checkProgress() -> Float {
      return Float(questionNumber) / Float(quiz.count);
  }
  func checkScore() -> Int {
      return score
  }
  
  mutating func nextQuestion() -> Bool {
      
      if(questionNumber + 1 < quiz.count){
        questionNumber += 1
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


