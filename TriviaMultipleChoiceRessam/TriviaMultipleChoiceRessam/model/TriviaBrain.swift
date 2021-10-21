//
//  TriviaBrain.swift
//  TriviaMultipleChoiceRessam
//
//  Created by Ressam Al-Thebailah on 15/03/1443 AH.
//

import Foundation

class TriviaBrain {
  var list = [Question]()
  init(){
    list.append(Question(question:"Which is the world's tallest peak?",
                         optionA:"Klimanjaro",
                         optionB:"Everest",
                         optionC:"Jabal Sawda",
                         optionD:"Montblanc",
                         correctAnswer: "Everest"))
    list.append(Question(question:"Which is the Capital of Australia?",
                         optionA: "Canberra",
                         optionB: "Sydney",
                         optionC: "Melbourne",
                         optionD:" Australia does not have a capital",
                         correctAnswer:"Canberra"))
    
    list.append(Question(question: "Rigoletto opera was composed by",
                         optionA: "Giacomo Puccini",
                         optionB: "Wolfgang Amadeus Mozart",
                         optionC: "Giuseppe Verdi",
                         optionD:"Richard Wagner",
                         correctAnswer: "Giuseppe Verdi"))
    list.append(Question(question:"Turandot opera was composed by",
                         optionA: "Richard Wagner",
                         optionB: "Giacomo Puccini",
                         optionC: "Wolfgang Amadeus Mozart",
                         optionD: "Giuseppe Verdi",
                         correctAnswer:"Giacomo Puccini"))
    list.append(Question(question: "The magic flute opera was composed by",
                         optionA: "Giacomo Puccini",
                         optionB:"Giuseppe Verdi",
                         optionC: "Wolfgang Amadeus Mozart ",
                         optionD: "Richard Wagner",
                         correctAnswer:"Wolfgang Amadeus Mozart "))
  }
}
