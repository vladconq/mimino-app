//
//  AudioButton.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class AudioButton: UIButton {
    
    // MARK: - Lifecycle
    
    init(color: UIColor) {
        super.init(frame: .zero)
        setImage(UIImage(#imageLiteral(resourceName: "AudioWave")).withRenderingMode(.alwaysTemplate), for: .normal)
        imageView?.tintColor = color
        adjustsImageWhenHighlighted = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
