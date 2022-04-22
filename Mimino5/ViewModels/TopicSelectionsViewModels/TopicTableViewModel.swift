//
//  TopicTableViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

class TopicTableViewModel {
    
    // MARK: - Properties
    
    // init
    let topics: [Topic]
    
    // MARK: - Lifecycle
    
    init(topics: [Topic]) {
        self.topics = topics
    }
    
    // MARK: - Helpers
    
    func getCellViewModel(index: Int) -> TopicCellViewModel {
        return TopicCellViewModel(topic: topics[index])
    }
    
}
