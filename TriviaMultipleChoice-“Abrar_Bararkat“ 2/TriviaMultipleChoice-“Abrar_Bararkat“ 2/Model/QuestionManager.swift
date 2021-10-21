
import Foundation
struct QuizManager {
    
    let quiz = [
        
        Question(question: "The language of Saudi Arabia ?", choices: ["English", "Arabic","spanish","French"], answer: "Arabic"),
        Question(question: "Capital of Saudi?", choices: ["Riyadh", "Jaddah","Abha","Tabuk"], answer: "Riyadh"),
        Question(question: "How many universities are there in Saudi Arabia?", choices: ["35", "24","40","37"], answer: "35"),
        Question(question: "currency of Saudi is ?", choices: ["Euro", "Dollar","Dinar","Riyal"], answer: "Riyal"),
        Question(question: "Saudi Arabia in ?", choices: ["Africa", "Euroup","Asia","Australia"], answer: "Asia"),
        
    ]
    
    var questionNumber = 0;
    var score = 0;
    
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        print(userAnswer)
        print(quiz[questionNumber].answer)
        if userAnswer == quiz[questionNumber].answer{
            score += 5
            return true;
        }
        score -= 5
        return false;
        
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
    
    mutating func nextQuestion() ->Bool {
        questionNumber += 1
        if (questionNumber == quiz.count) {
            questionNumber=0
            score = 0;
            return false
        }
        else{
            return true
            
        }
    }
    
    
}
