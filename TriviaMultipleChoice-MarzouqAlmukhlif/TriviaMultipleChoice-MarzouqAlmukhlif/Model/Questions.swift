//
//  Questions.swift
//  TriviaMultipleChoice-MarzouqAlmukhlif
//
//  Created by Marzouq Almukhlif on 15/03/1443 AH.
//

import Foundation

struct Questions {
  private let questions = [
    MultiChoiceQuestion(
      question: "How many rings are on the Olympic flag?",
      answers: ["None","4","5","7"],
      correctAnswer: "5"
    ),
    
    MultiChoiceQuestion(
    question: "The magic flute opera was composed by",
    answers: ["Giacomo Puccini", "Giuseppe Verdi", "Wolfgang Amadeus Mozart", "Richard Wagner"],
    correctAnswer: "Wolfgang Amadeus Mozart"
    ),
    
    MultiChoiceQuestion(
      question: "What is a tarsier?",
      answers: ["A primate","A lizard","A bird","A insect"],
      correctAnswer: "A primate"
    ),
    
    MultiChoiceQuestion(
      question: "Which is the world's tallest peak?",
      answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
      correctAnswer: "Everest"
    ),
    
    MultiChoiceQuestion(
      question: "How did Spider-Man get his powers?",
      answers: ["Military experiment gone awry","Born with them","Woke up with them after a strange dream","Bitten by a radioactive spider"],
      correctAnswer: "Bitten by a radioactive spider"
    ),
    
    MultiChoiceQuestion(
    question: "Turandot opera was composed by",
    answers: ["Richard Wagner", "Giacomo Puccini", "Wolfgang Amadeus Mozart", "Giuseppe Verdi"],
    correctAnswer: "Giacomo Puccini"
    ),

    MultiChoiceQuestion(
      question: "How many holes are on a standard bowling ball?",
      answers: ["2","3","5","10"],
      correctAnswer: "3"
    ),
    
    MultiChoiceQuestion(
      question: "Which is the Capital of Australia?",
      answers: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"],
      correctAnswer: "Canberra"
    ),
    
    
    MultiChoiceQuestion(
      question: "Which of these animals does NOT appear in the Chinese zodiac?",
      answers: ["Bear","Rabbit","Dragon","Dog"],
      correctAnswer: "Bear"
    ),

    
    MultiChoiceQuestion(
      question: "Which is the Capital of Australia?",
      answers: ["Canberra", "Sydney", "Melbourne", "Australia does not have a capital"],
      correctAnswer: "Canberra"
    ),
    




    
  ]
  
  

  
  



  
  func getQuestion() -> [MultiChoiceQuestion] {
    return questions
  }
}
