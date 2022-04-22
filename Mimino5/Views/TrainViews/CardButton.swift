//
//  CardButton.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class CardButton: UIButton {
    
    init(text: String, tag: Int = 1, fontSize: CGFloat = 20) {
        super.init(frame: .zero)
        
        self.tag = tag
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        setTitle(text, for: .normal)
        
        setHeight(height: 60)
        layer.cornerRadius = 5
        setTitleColor(.mainBlackColor.withAlphaComponent(0.9), for: .normal)
        backgroundColor = .mainBlackColor.withAlphaComponent(0.035)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
