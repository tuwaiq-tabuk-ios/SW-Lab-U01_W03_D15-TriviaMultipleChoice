//
//  Quiz.swift
//  TriviaMultipleChoice-Maha.Nasser
//
//  Created by Maha S on 21/10/2021.
//

import Foundation

struct Quiz {
    
    let question : String
    let answer : [String]
    let correctAnswer : String
}

var questionNumber : Int = 0
var score = 0

let questions = [
    
    Quiz(
        question: "What is the largest Lake in Italy?",
        answer: ["Maggiore", "Como", "Grada", "Bolsena"],
        correctAnswer: "Grada"),
    
    Quiz(
        question: "Who is the first president of Italy?",
        answer: ["Luigi Einaudi", "Enrico De Nicola",
                 "Giovanni Gronchi", "Antonio Sengi"],
        correctAnswer: "Enrico De Nicola"),
    
    Quiz(
        question: "What is the largest state in USA?",
        answer: ["Alaska", "Texas", "Montana", "California"],
        correctAnswer: "Alaska"),
    
    Quiz(
        question: "Which artist painted (The Scream) painting?",
        answer: ["Vincent Van Gogh", "Edvard Munch", "Da Venci", "Claude Monet"],
        correctAnswer: "Edvard Munch"),
    
    Quiz(
        question: "What is the capital of KSA?",
        answer: ["Tabuk", "Jeddah", "Riyadh", "Abha"],
        correctAnswer: "Riyadh")
]


func getAnswer (_ selectedAnswer : String) -> Bool{
    let questionAnswer = questions[questionNumber].correctAnswer
    if selectedAnswer == questionAnswer {
        score += 1
        return true
    }else{
        return false
    }
    
}


func getQuestion() -> String {
    return questions[questionNumber].question
}


func getProgress() -> Float {
    return Float(questionNumber + 1) / Float(questions.count)
}


func getNextQuestion() {
    if questionNumber + 1 < questions.count{
        questionNumber += 1
    }else{
        questionNumber = 0
        score = 0
    }



func getScore() -> Int {
    return score
}

}



