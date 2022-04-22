//
//  MenuButtonViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

class MenuButtonViewModel {
    
    // MARK: - Properties
    
    // init
    private let sectionTrainType: SectionTrainType
    
    // managers
    private let letterManager = LetterManager.shared
    private let topicManager = TopicManager.shared
    private let scoreManager = ScoreManager.shared
    
    // ui
    var trainName: String { sectionTrainType.name }
    var trainDescription: String { sectionTrainType.description }
    var colorTheme: UIColor { sectionTrainType.colorTheme }
    var circleCenterPoint: CGPoint { sectionTrainType.circleCenterPoint }
    var menuButtonHeight: CGFloat { sectionTrainType.menuButtonHeight }
    
    var highScoreText: String? {
        let highScore = scoreManager.getHighScoreForActiveTopic(sectionTrainType: sectionTrainType)
        
        var termsCount: Int
        switch sectionTrainType {
        case .letterQuiz, .letterMemory:
            termsCount = letterManager.getLetters().count
        case .wordQuiz, .wordMemory:
            termsCount = topicManager.getActiveTopic().words.count
        default:
            return nil
        }
        
        return "\(highScore) из \(termsCount) - \(sectionTrainType.highScoreText!)"
    }
    
    // MARK: - Lifecycle
    
    init(sectionTrainType: SectionTrainType) {
        self.sectionTrainType = sectionTrainType
    }
    
}
