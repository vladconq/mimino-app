//
//  TopicSelectionController.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class TopicSelectionController: UIViewController {
    
    // MARK: - Properties
    
    // managers
    private let topicManager = TopicManager.shared
    
    // ui
    private var topicTable: TopicTable?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        injectData()
        configureUI()
    }
    
    // MARK: - Data
    
    func injectData() {
        let topics = topicManager.getTopics()
        topicTable = TopicTable(viewModel: TopicTableViewModel(topics: topics))
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureTopicTable()
    }
    
    func configureSelf() {
        view.backgroundColor = .mainWhiteColor
        topicTable?.delegateTopicTable = self
    }
    
    func configureTopicTable() {
        view.addSubview(topicTable!)
        topicTable?.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, paddingTop: 25)
    }
    
    // MARK: - Helpers
    
    func redrawTable() {
        topicTable?.reloadData()
    }
    
}

extension TopicSelectionController: TopicTableDelegate {
    func closeTopicSelectionController() {
        dismiss(animated: true, completion: nil)
    }
}
