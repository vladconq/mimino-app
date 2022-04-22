//
//  SettingsManager.swift
//  Mimino5
//
//  Created by Vladislav on 27.10.2021.
//

import Foundation

enum SwitchType: String {
    case autoPronunciation = "AutoPronunciationSwitch"
    case vibration = "VibrationSwitch"
}

class SwitchSettingsManager {
    
    // MARK: - Properties
    
    static var shared = SwitchSettingsManager()
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Helpers
    
    func toggleSwitch(switchType: SwitchType) {
        UserDefaults.standard.setValue(!isOn(switchType: switchType), forKey: switchType.rawValue)
    }
    
    func isOn(switchType: SwitchType) -> Bool {
        guard UserDefaults.standard.object(forKey: switchType.rawValue) != nil else { return true }
        return UserDefaults.standard.bool(forKey: switchType.rawValue)
    }

}
