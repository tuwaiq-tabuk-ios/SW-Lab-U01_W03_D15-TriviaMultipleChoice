
import Foundation
struct Question {
  
  let question :String
  let answer :[String]
  let correctAnswer :String
}

struct QuastionBank {
  
  var currentQuestion :Question?
  
  var quiz :[Question] = [
    
    
    Question( question: "2+2 ", answer: ["1" ,"2" ,"4"," 3"], correctAnswer: "4"),
    
    
    Question( question: "2+1 ", answer: ["1" ,"2" ,"4"," 3"], correctAnswer: "3"),
    
    Question( question: "2-1 ", answer: ["1" ,"2" ,"4"," 3"], correctAnswer: "1"),
    
    Question( question: "2+0 ", answer: ["1" ,"2" ,"4"," 3"], correctAnswer: "2")]
  
  
  var questionNumber = 0
  var score = 0
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
//    print(userAnswer)
//    print(quiz[questionNumber].correctAnswer)
//
    let trueAnswer = quiz[questionNumber].correctAnswer
    if userAnswer == trueAnswer  {
      score+=1
      return true
    } else{
      return false
    }
    
  }
    
    func getQuestions() -> String {
      return quiz[questionNumber].question
    }
  
    func getChoices() -> [String] {
      return quiz[questionNumber].answer
    }
  
    func getCorrectAnswer() -> String {
      return quiz[questionNumber].correctAnswer
    }
    func checkProgress() -> Float {
      return Float(questionNumber) / Float(quiz.count);
    }
    func checkScore() -> Int {
      return score
    }
    
  mutating func nextQuestion(){
      questionNumber += 1
      if(questionNumber==quiz.count){
        questionNumber=0
        score = 0
      }
    }

  mutating func startGame(){
    score = 0
    questionNumber = 0
  }
  
}
