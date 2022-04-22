//
//  TopicSelectionButtonViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class TopicSelectionButtonViewModel {
    
    // MARK: - Properties
    
    private let topicManager = TopicManager.shared
    
    var activeTopicName: String {
        topicManager.getActiveTopic().name
    }
    
    var activeTopicIcon: UIImage {
        topicManager.getActiveTopic().icon
    }
    
}
