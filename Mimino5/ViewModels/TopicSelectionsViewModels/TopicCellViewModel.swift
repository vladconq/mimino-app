//
//  TopicCellViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class TopicCellViewModel {
    
    // MARK: - Properties
    
    // init
    private let topic: Topic
    
    // managers
    private let scoreManager = ScoreManager.shared
    
    // ui
    
    var topicName: String {
        return topic.name
    }
    
    var topicIcon: UIImage {
        return topic.icon
    }
    
    var topicProgress: Float {
        let highScoreQuiz = scoreManager.getHighScoreForTopic(sectionTrainType: .wordQuiz, topicName: topicName)
        let highScoreMemory = scoreManager.getHighScoreForTopic(sectionTrainType: .wordMemory, topicName: topicName)
        return Float(highScoreQuiz + highScoreMemory) / Float(topic.words.count * 2)
    }
    
    // MARK: - Lifecycle
    
    init(topic: Topic) {
        self.topic = topic
    }
    
}
