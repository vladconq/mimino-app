//
//  Topic.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

class Topic {
    let name: String
    let words: [Word]
    let icon: UIImage
    var isActive: Bool
    
    init(name: String, words: [Word], icon: UIImage, isActive: Bool) {
        self.name = name
        self.words = words
        self.icon = icon
        self.isActive = isActive
    }
}

