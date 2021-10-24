//
//  Operation.swift
//  Operation
//
//  Created by arwaBalawi on 15/03/1443 AH.
//

import Foundation

class Operation
{
    var Question  = [Data]()
    
    
    init()
    {
        let question1 = Data(question: "Which is the world's tallest peak?", answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"], correctAnswer: "Everest")
        let question2 = Data(question: "Which is the Capital of Australia?", answers: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"], correctAnswer: "Canberra")
        let question3 = Data(question: "Rigoletto opera was composed by", answers:  ["Giacomo Puccini", "Wolfgang Amadeus Mozart","Giuseppe Verdi", "Richard Wagner"], correctAnswer: "Giuseppe Verdi")
        let question4 = Data(question: "Turandot opera was composed by", answers:  ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"], correctAnswer: "Giacomo Puccini")
        let question5 = Data(question: "The magic flute opera was composed by", answers: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"], correctAnswer: "Wolfgang Amadeus Mozart")
        Question.append(question1)
        Question.append(question2)
        Question.append(question3)
        Question.append(question4)
        Question.append(question5)
    }
    
    
}
