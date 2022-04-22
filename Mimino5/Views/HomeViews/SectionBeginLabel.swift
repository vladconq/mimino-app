//
//  SectionBeginLabel.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

class SectionBeginLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        
        self.text = "   \(text)"
        textColor = .mainBlackColor.withAlphaComponent(0.7)
        font = UIFont(name: Fonts.robotoBold, size: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
