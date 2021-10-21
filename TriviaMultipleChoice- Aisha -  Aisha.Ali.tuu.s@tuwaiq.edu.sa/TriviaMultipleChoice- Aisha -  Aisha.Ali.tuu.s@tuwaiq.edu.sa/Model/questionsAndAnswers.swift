//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Visal Rajapakse on 5/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct  Question {
    
    //struct properties
    var question : String
    var answer : String
    
    //method to initialize the struct
    init(q : String, a : String) {
        self.question = q
        self.answer = a
    }
    
}

struct questionsAndAnswers{
    
    var questionNumber : Int = 0
    var score : Int = 0

    let questions = [
        Question(q: "Q1: Frodo Is 33 At The Beginning Of The Fellowship Of The Ring.", a: "True"),
        Question(q: "Q2: Hobbits Live In Bree.", a: "True"),
        Question(q: "Q3: Durin's Folk Are Dwarves.", a: "False"),
        Question(q: "Q4: 7 Rings Were Given To Elves.", a: "False"),
        Question(q: "Q5: Gandalf Tells Aragorn To Look To The East On The First Light Of The Fourth Day", a: "False"),
        Question(q: "Q6: Samwise Gamgee Is Frodo's Cook.", a: "False"),
        Question(q: "Q7: Isildur Is Aragorn's Grandfather", a: "False"),
        Question(q: "Q8: The Witch King Of Angmar Used To Be An Elf.", a: "False"),
        Question(q: "Q9: The fellowship of the ring splits up at Amon Hen.", a: "True"),
        Question(q: "Q10: Gollum's hobbit name was 'Smeagol'", a: "True")
    ]
    
    //getter methods
    mutating func getAnswer(_ selectedAnswer : String) -> Bool{
      
        let questionAnswer = questions[questionNumber].answer
        if selectedAnswer == questionAnswer{
            score += 1
            return true
        }else{
            return false
        }
    }
    
  
  func getQuestion() -> String {
      return questions[questionNumber].question
  }
  
  
  func getProgress() -> Float{
      return Float(questionNumber + 1) / Float(questions.count)
  }
  
  
  mutating func getNextQuestion() ->Bool{
    if questionNumber + 1  < questions.count{
      questionNumber += 1
      return true
    }else{
      return false
    }
  }
  
  
  func getScore() -> Int{
      return score
  }
  
  
  mutating func startGame(){
    questionNumber = 0
    score = 0
  }
  
}

