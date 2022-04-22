//
//  TextButton.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit

class TextButton: UIButton {
    
    // MARK: - Lifecycle
    
    init(title: String, isHidden: Bool) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        self.isHidden = isHidden
        setHeight(height: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
