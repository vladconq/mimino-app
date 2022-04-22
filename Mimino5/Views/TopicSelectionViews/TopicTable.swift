//
//  TopicTable.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

protocol TopicTableDelegate {
    func closeTopicSelectionController()
}

class TopicTable: UITableView {
    
    // MARK: - Properties
    
    // init
    private let viewModel: TopicTableViewModel
    
    // delegates
    var delegateTopicTable: TopicTableDelegate?
    
    // managers
    private let topicManager = TopicManager.shared
    
    // MARK: - Lifecycle
    
    init(viewModel: TopicTableViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func configureUI() {
        backgroundColor = .clear
        dataSource = self
        delegate = self
        rowHeight = 80
        register(TopicTableCell.self, forCellReuseIdentifier: TopicTableCell.reuseIdentifier)
        delaysContentTouches = false
        tableFooterView = UIView()
        separatorStyle = .none
    }
}

extension TopicTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopicTableCell.reuseIdentifier, for: indexPath) as! TopicTableCell
        cell.viewModel = viewModel.getCellViewModel(index: indexPath.row)
        return cell
    }
}

extension TopicTable: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topicManager.setActiveTopic(topic: viewModel.topics[indexPath.row])
        delegateTopicTable?.closeTopicSelectionController()
    }
}
