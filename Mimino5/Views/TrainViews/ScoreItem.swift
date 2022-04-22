//
//  ScoreItem.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class ScoreItem: UIStackView {
    
    // MARK: - Properties
    
    private let scoreValue: Int
    private let scoreText: String
    
    lazy var scoreValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor
        label.font = UIFont(name: Fonts.robotoRegular, size: 90)
        label.text = "\(scoreValue)"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var scoreTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlackColor.withAlphaComponent(0.7)
        label.font = UIFont(name: Fonts.robotoRegular, size: 14)
        label.text = scoreText
        return label
    }()
    
    // MARK: - Lifecycle
    
    init(scoreValue: Int, scoreText: String) {
        self.scoreValue = scoreValue
        self.scoreText = scoreText
        super.init(frame: .zero)
        
        axis = .vertical
        alignment = .center
        distribution = .equalCentering
        [scoreValueLabel, scoreTextLabel].forEach {
            view in addArrangedSubview(view)
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
