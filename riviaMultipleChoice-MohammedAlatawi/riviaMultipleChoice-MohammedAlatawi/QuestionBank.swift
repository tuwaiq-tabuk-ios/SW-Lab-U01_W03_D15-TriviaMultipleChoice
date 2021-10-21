//
//  QuestionBank.swift
//  riviaMultipleChoice-MohammedAlatawi
//
//  Created by محمد العطوي on 15/03/1443 AH.
//

import Foundation

struct QuestionBank {
    
    let questions = [
        Question(
            questions:
                "Which is the world's tallest peak?",
            choice: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
            correct: "Everest"
        ),
        Question(
            questions:
                "Which is the Capital of Australia?",
            choice: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"],
            correct: "Canberra"
        ),
        Question(
            questions:
                "Rigoletto opera was composed by",
            choice: ["Giacomo Puccini", "Wolfgang Amadeus Mozart",
                     "Giuseppe Verdi", "Richard Wagner"],
            correct: "Giuseppe Verdi"
        ),
        Question(
            questions:
                "Turandot opera was composed by",
            choice: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"],
            correct: "Giacomo Puccini"
        ),
        Question(
            questions:
                "The magic flute opera was composed by",
            choice: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"],
            correct: "Wolfgang Amadeus Mozart"
        )
    ]
    
    var questionNumber = 0
    var scor = 0
    
    mutating func nextQuestionIndx() {
        
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            scor = 0
        }
        
    }
    func getAnswers(Index:Int) -> String {
        return questions[questionNumber].answers[Index]
    }
    func getQuestion() -> String {
        return questions[questionNumber].question
    }
    mutating func checkAnswers(_ userAnswer: String) -> Bool {
        
        if userAnswer == questions[questionNumber].correctAnswer{
            scor += 5
            return true
        } else {
            scor -= 10
            return false
        }
    }
    func getprogress() -> Float {
        let progress = Float (questionNumber) / Float(questions.count)
        return progress
    }
    func getScore() -> Int {
        return scor
    }
    
}




