//
//  AlphabetController.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit

class AlphabetController: UIViewController {
    
    // MARK: - Properties
    
    // managers
    private let letterManager = LetterManager.shared
    
    // ui
    private var letterTable: LetterTable?
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Алфавит"
        label.textColor = .mainBlackColor.withAlphaComponent(0.85)
        label.font = .systemFont(ofSize: 24, weight: .light)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        injectData()
        configureUI()
    }
    
    // MARK: - Data
    
    func injectData() {
        let letters = letterManager.getLetters()
        letterTable = LetterTable(viewModel: LetterTableViewModel(letters: letters))
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSelf()
        configureHeaderLabel()
        configureLetterTable()
    }
    
    func configureSelf() {
        view.backgroundColor = .mainWhiteColor
    }
    
    func configureHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.anchor(top: view.topAnchor, paddingTop: 25)
        headerLabel.centerX(inView: self.view)
    }
    
    func configureLetterTable() {
        view.addSubview(letterTable!)
        letterTable?.anchor(top: headerLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
    }
    
}
