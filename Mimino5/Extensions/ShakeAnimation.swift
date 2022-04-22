//
//  ShakeAnimation.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import UIKit

extension UIView {
    func applyShakeAnimation() {
        let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        shake.duration = 0.2
        shake.values = [-8.0, 8.0, -3.0, 3.0, -2.0, 2.0]
        self.layer.add(shake, forKey: nil)
    }
}
