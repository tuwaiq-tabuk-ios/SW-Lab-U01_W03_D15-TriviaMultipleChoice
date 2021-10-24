//
//  Operation.swift
//  Operation
//
//  Created by arwaBalawi on 15/03/1443 AH.
//

import Foundation
import AVFoundation
class Operation
{
    var Question  = [Data]()
    let successedScore = 5
    let failedScore = -10
    var player : AVAudioPlayer?
    init()
    {
        let question1 = Data(question: "Which is the world's tallest peak?", answers: ["Klimanjaro ", "Everest", "Jabal Sawda", "Montblanc"], correctAnswer: "Everest")
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
    
    
    func hasUserGoodScore(currentScore : Int)
    {
        let maxScore = Question.count * successedScore
        
        let percentageScore : Double = Double(currentScore) / Double(maxScore)
        if percentageScore >= 0.7
        {
            playSound(isSuccessed: true)
        }else{
            playSound(isSuccessed: false)
        }
    }
    func playSound(isSuccessed : Bool)
    {
        var url : URL
        if isSuccessed
        {
            url = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        }else
        {
            url = Bundle.main.url(forResource: "sound2", withExtension: "mp3")!
            
        }
           
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                /* iOS 10 and earlier require the following line:
                 player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                
                guard let player = player else { return }
                
                player.play()
                
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        
        func stopSound(){
            player?.stop()
        }
        
    
    
}
