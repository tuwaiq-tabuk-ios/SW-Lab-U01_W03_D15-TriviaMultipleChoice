//
//  QuestionBank.swift
//  TriviMultipleChoice_App
//
//  Created by Mohammed on 15/03/1443 AH.
//

import Foundation

 
struct QuestionBank {
    
    
    var questionNumber = 0
    var score = 0
    
        let questions = [
            Question(question: "Which movie was directed by Ingmar Bergman?", answer: ["Birdman","Persona","11 angry men","MoonLight"], rightAnswer: "Persona"),
            Question(question: "Symphony No. 40 was by?", answer: ["Beethoven","Vivaldi","Bach","Mozart"], rightAnswer: "Mozart"),
            Question(question: "Fight Club 1999 was directed by?", answer: ["Tarantino","Nolan", "Fincher","Kubrick"], rightAnswer: "Fincher"),
            Question(question: "The four season by Vivaldi which one was the first of this work?", answer: ["Spring","Winter","Autumn","Summer"], rightAnswer: "Spring"),
            Question(question: "What is the last movie directed by stanley kubrick?", answer: ["The shining","Eyes Wide Shot","Her","Persone"], rightAnswer: "Eyes Wide Shot"),
            
        ]
   
    func getQuestionText() -> String {
        return questions[questionNumber].questionText
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return questions[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(questions.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == questions[questionNumber].correctAnswer {
            score += 5
            return true
        } else {
            score -= 5
            return false 
        }
        
    }


    
    
    


}
