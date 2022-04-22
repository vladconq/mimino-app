//
//  UIScrollView.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

class UIButtonScrollView: UIScrollView {
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view.isKind(of: UIButton.self) {
            return true
        }
        
        return super.touchesShouldCancel(in: view)
    }
}
