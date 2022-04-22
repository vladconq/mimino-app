//
//  LetterTable.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit

class LetterTable: UITableView {
    
    // MARK: - Properties
    
    // init
    private let viewModel: LetterTableViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: LetterTableViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        dataSource = self
        rowHeight = 90
        register(LetterTableCell.self, forCellReuseIdentifier: LetterTableCell.reuseIdentifier)
        allowsSelection = false
        delaysContentTouches = false
        separatorStyle = .none
        
        let customInset: CGFloat = 20
        backgroundColor = .mainWhiteColor
        contentInset.top = customInset
        contentInset.bottom = customInset
    }
    
}

extension LetterTable: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getLettersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LetterTableCell.reuseIdentifier, for: indexPath) as! LetterTableCell
        cell.viewModel = viewModel.getCellViewModel(index: indexPath.row)
        return cell
    }
    
}
