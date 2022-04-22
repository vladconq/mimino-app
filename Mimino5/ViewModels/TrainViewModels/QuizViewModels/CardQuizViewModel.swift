//
//  CardQuizViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit
import AVFoundation

class CardQuizViewModel {
    
    // MARK: - Properties
    
    // init
    private let question: Question
    let sectionTrainType: SectionTrainType
    
    // managers
    private let switchSettingsManager = SwitchSettingsManager.shared
    
    var correctAnswerIndex: Int {
        question.answers.firstIndex(of: question.answers.filter { $0.correct == true }.first!)!
    }
    
    var colorTheme: UIColor {
        sectionTrainType.colorTheme
    }
    
    // audio
    private var audioPlayer: AVAudioPlayer?
    private var audioPlayer2: AVAudioPlayer?
    
    var answerFontSize: CGFloat? {
        switch sectionTrainType {
        case .letterQuiz:
            return 20
        case .wordQuiz:
            return 16
        default:
            return nil
        }
    }
    
    // MARK: - Lifecycle
    
    init(question: Question, sectionTrainType: SectionTrainType) {
        self.question = question
        self.sectionTrainType = sectionTrainType
    }
    
    // MARK: - Helpers
    
    func getQuestion() -> Question {
        return question
    }
    
    func getSectionTrainType() -> SectionTrainType {
        return sectionTrainType
    }
    
    func checkAnswer(selectedAnswerIndex: Int) -> Bool {
        return selectedAnswerIndex == correctAnswerIndex
    }
    
    func playLetterSound() {
        let data = NSDataAsset(name: question.text)!
        
        do {
            audioPlayer = try AVAudioPlayer(data: data.data)
            
            if switchSettingsManager.isOn(switchType: .autoPronunciation) {
                audioPlayer?.play()
            }
        } catch {
            return
        }
    }
    
//    func playAnswerSound(answerType: AnswerType) {
//        var data: NSDataAsset
//        
//        switch answerType {
//        case .correct:
//            data = NSDataAsset(name: "correct")!
//        case .wrong, .skipped:
//            data = NSDataAsset(name: "wrong")!
//            
//            switch sectionTrainType {
//            case .letterQuiz:
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
//                    let data = NSDataAsset(name: self.question.text)!
//                    
//                    do {
//                        self.audioPlayer2 = try AVAudioPlayer(data: data.data)
//                        
//                        if self.switchSettingsManager.isOn(switchType: .autoPronunciation) {
//                            self.audioPlayer2?.play()
//                        }
//                    } catch {
//                        return
//                    }
//                }
//            default:
//                break
//            }
//
//
//        }
//        
//        do {
//            audioPlayer = try AVAudioPlayer(data: data.data)
//            audioPlayer?.play()
//        } catch {
//            return
//        }
//    }
    
}
