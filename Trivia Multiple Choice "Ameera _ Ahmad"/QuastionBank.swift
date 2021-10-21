import Foundation

struct QuestionBank {
  
  let questionList = [
    MyQuestion(question: "What is the capital of Saudi Arabia?",
               answers: ["Cairo" , "Riyadh" , "Washington" , "Beirut"],
               correctAnswer: "Riyadh"),
    MyQuestion(question: "What is the capital of the Emirates?",
               answers: ["Beirut" , "Riyadh" , "Abu Dhabi" , "Cairo"],
               correctAnswer: "Abu Dhabi"),
    MyQuestion(question: "What is the capital of Lebanon?",
               answers: ["Beirut" , "Abu Dhabi" , "Washington" , "Rabat"],
               correctAnswer: "Beirut"),
    MyQuestion(question: "What Is The Capital Of Egypt?",
               answers: ["Rabat" , "Cairo" , "Riyadh" , "Beirut"],
               correctAnswer: "Cairo"),
    MyQuestion(question: "What is the capital of Morocco?",
               answers: ["Beirut" , "Cairo" , "Abu Dhabi" , "Rabat"],
               correctAnswer: "Rabat")
  ]
  
 
  var qustionNumber = 0
  var score = 0
  
 
  mutating func isAnswerCorrect(userAnswer: String) -> Bool{
    
    print("line 27\(userAnswer)")
    print("line 28\(questionList[qustionNumber].correctAnswer)")
    
    let correctQuestion = (questionList[qustionNumber].correctAnswer)
    
    if userAnswer == correctQuestion{
      
      score += 5
      
      return true
    }else{
      score -= 5
      return false
    }
  }
  
  
  func getQuestion()-> String {
    return  questionList[qustionNumber].question
  }
  
  
  func getChoices() -> [String]{
    return questionList[qustionNumber].answers
  }
  
  
  func getRightChoices()-> String{
    return questionList[qustionNumber].correctAnswer
  }
  
  
  func getProgress()->Float{
    return (Float(qustionNumber+1)/Float(questionList.count))
  }
  
  
  func getScore()-> Int {
    return score
  }
  
  
  func getQuestionLabelText() -> String {
    questionList[qustionNumber].question
  }
  
 
  mutating func nextQuestion() -> Bool{
    
    if (qustionNumber + 1 < questionList.count) {
      qustionNumber += 1
      return true
      
    }else{
      return false
    }
  }
  

  mutating func startGame(){
    score = 0
    qustionNumber = 0
  }
}

