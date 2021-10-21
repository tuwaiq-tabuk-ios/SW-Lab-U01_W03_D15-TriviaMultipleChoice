//
//  TriviaBrain.swift
//  TriviaMultipleChoice-BushraAlatawi
//
//  Created by bushra nazal alatwi on 15/03/1443 AH.
//

import Foundation
struct TriviaBrain {
    
    var questionNumber = 0
    var score = 0
    
    let questions = [MultipleChoiesQuestion(question: "Which is the world's tallest peak?",
  answers: "Klimanjaro", "Everest", "Jabal Sawda", "Montblanc",
  correctAnswer: "Everest"),
                     MultipleChoiesQuestion(question: "Which is the Capital of Australia?",
  answers:"Canberra", "Sydney", "Melbourne", "Australia does nothave a capital",
  correctAnswer: "Canberra"),
                     MultipleChoiesQuestion(question: "Rigoletto opera was composed by",answers:"Giacomo Puccini", "Wolfgang Amadeus Mozart",
"Giuseppe Verdi", "Richard Wagner",
  correctAnswer: "Giuseppe Verdi"),
                     MultipleChoiesQuestion(question: "Turandot opera was composed by",
  answers:"Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi", correctAnswer: "Giacomo Puccini"),
                     MultipleChoiesQuestion(question: "The magic flute opera was composed by",
  answers:"Giacomo Puccini", "Giuseppe Verdi", "Wolfgang AmadeusMozart","Richard Wagner",
    correctAnswer: "Wolfgang Amadeus Mozart")
    ]
}

