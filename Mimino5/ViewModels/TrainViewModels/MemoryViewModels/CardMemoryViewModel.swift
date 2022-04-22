//
//  File.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit
import AVFoundation

class CardMemoryViewModel {
    
    // MARK: - Properties
    
    // init
    private let term: Term
    let sectionTrainType: SectionTrainType
    
    // audio
    private var audioPlayer: AVAudioPlayer?
    
    // managers
    private let switchSettingsManager = SwitchSettingsManager.shared
    
    // ui
    
    var termOrigin: String {
        term.origin
    }
    
    var colorTheme: UIColor {
        sectionTrainType.colorTheme
    }
    
    var termTransliteration: String? {
        if sectionTrainType == .letterMemory {
            let letter = term as! Letter
            return letter.transliteration
        } else {
            return nil
        }
    }
    
    var termTranslation: String? {
        if sectionTrainType == .wordMemory {
            let word = term as! Word
            return word.translation
        } else {
            return nil
        }
    }
    
    var exampleWordLabelAttributedText: String? {
        if sectionTrainType == .letterMemory {
            let letter = term as! Letter
            return letter.clarification
        } else {
            return nil
        }
    }
    
    // MARK: - Lifecycle
    
    init(term: Term, sectionTrainType: SectionTrainType) {
        self.term = term
        self.sectionTrainType = sectionTrainType
    }
    
    // MARK: - Helpers
    
    func playLetterSound() {
        let data = NSDataAsset(name: term.pronunciationAudioPath)!
        
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
