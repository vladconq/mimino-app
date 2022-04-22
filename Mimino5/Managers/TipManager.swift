//
//  TipManager.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import Foundation

class TipManager {
    
    // MARK: - Properties
    
    static var shared = TipManager()
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Helpers
    
    func getRandomPositiveTip() -> String {
        return Tips.positiveTips.randomElement()!
    }
    
    func getRandomNegativeTip() -> String {
        return Tips.negativeTips.randomElement()!
    }
    
    func getRandomSkippedTip() -> String {
        return Tips.skippedTips.randomElement()!
    }
    
}
