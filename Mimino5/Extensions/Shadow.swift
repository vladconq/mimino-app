//
//  Shadow.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

extension UIView {
    func applyShadow(opacity: Float = 0, radius: CGFloat = 0, offset: CGSize = .zero, color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
}
