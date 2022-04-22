//
//  ScoreManager.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

protocol ScoreManagerDelegate {
    func updateHighScore()
}

class ScoreManager {
    
    // MARK: - Properties
    
    static var shared = ScoreManager()
    
    // delegate
    var delegate: ScoreManagerDelegate?
    
    // managers
    let topicManager = TopicManager.shared
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Helpers
    
    func getHighScoreForActiveTopic(sectionTrainType: SectionTrainType) -> Int {
        var key: String
        
        switch sectionTrainType {
        case .letterQuiz, .letterMemory:
            key = sectionTrainType.rawValue
        case .wordQuiz, .wordMemory:
            key = "\(sectionTrainType.rawValue)\(topicManager.getActiveTopic().name)"
        case .letterAlphabet:
            return 0
        }

        return UserDefaults.standard.integer(forKey: key)
    }
    
    func getHighScoreForTopic(sectionTrainType: SectionTrainType, topicName: String) -> Int {
        let key = "\(sectionTrainType.rawValue)\(topicName)"
        return UserDefaults.standard.integer(forKey: key)
    }
    
    func updateHighScore(newScore: Int, sectionTrainType: SectionTrainType) {
        var key: String
        
        switch sectionTrainType {
        case .letterQuiz, .letterMemory:
            key = sectionTrainType.rawValue
        case .wordQuiz, .wordMemory:
            key = "\(sectionTrainType.rawValue)\(topicManager.getActiveTopic().name)"
        case .letterAlphabet:
            return
        }
        
        let oldHighScore = UserDefaults.standard.integer(forKey: key)
        
        if newScore > oldHighScore {
            UserDefaults.standard.set(newScore, forKey: key)
            delegate?.updateHighScore()
        }
    }
    
    func resetScore() {
        let topics = topicManager.getTopics()

        for sectionTrainType in SectionTrainType.allCases {
            switch sectionTrainType {
            case .letterQuiz, .letterMemory:
                UserDefaults.standard.removeObject(forKey: sectionTrainType.rawValue)
            case .wordQuiz, .wordMemory:
                for topic in topics {
                    UserDefaults.standard.removeObject(forKey: "\(sectionTrainType.rawValue)\(topic.name)")
                }
            default:
                continue
            }
        }
        
        delegate?.updateHighScore()
    }
    
}
