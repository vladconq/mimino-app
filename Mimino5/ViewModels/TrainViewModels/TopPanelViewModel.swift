//
//  TopPanelViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

protocol TopPanelViewModelDelegate {
    func updateTopPanelView()
}

class TopPanelViewModel {
    
    // MARK: - Properties
    
    // init
    private var terms: [Any]
    
    // delegate
    var delegate: TopPanelViewModelDelegate?
    
    var currentIndex = 0 {
        didSet {
            delegate?.updateTopPanelView()
        }
    }
    
    var progressText: String {
        "\(currentIndex + 1) / \(terms.count)"
    }
    
    var progressValue: Float {
        Float(currentIndex) / Float(terms.count - 1)
    }
    
    // MARK: - Lifecycle
    
    init(terms: [Any]) {
        self.terms = terms
    }
    
    // MARK: - Helpers
    
    func incrementCurrentIndex() {
        currentIndex += 1
    }
    
}
