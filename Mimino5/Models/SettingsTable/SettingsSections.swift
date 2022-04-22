//
//  Sections.swift
//  Mimino5
//
//  Created by Vladislav on 22.10.2021.
//

protocol SettingType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingsSections: Int, CaseIterable {
    case Audio
    case Support
    case Danger
    
    var description: String {
        switch self {
        case .Audio: return "Аудио"
        case .Support: return "Поддержка"
        case .Danger: return ""
        }
    }
}

enum AudioOptions: Int, CaseIterable, SettingType {
    case autoPronunciation
    case vibration
    
    var description: String {
        switch self {
        case .autoPronunciation: return "Автопроизношение"
        case .vibration: return "Вибрации"
        }
    }
    
    var containsSwitch: Bool {
        switch self {
        case .autoPronunciation: return true
        case .vibration: return true
        }
    }
}

enum SupportOptions: Int, CaseIterable, SettingType {
    case rateApp
//    case shareApp
    case suggestImprovement
    
    var description: String {
        switch self {
        case .rateApp: return "🏆 Оценить приложение"
//        case .shareApp: return "👥 Поделиться приложением"
        case .suggestImprovement: return "🎯 Предложить улучшение"
        }
    }
    
    var containsSwitch: Bool {
        switch self {
        case .rateApp: return false
//        case .shareApp: return false
        case .suggestImprovement: return false
        }
    }
}

enum DangerOptions: Int, CaseIterable, SettingType {
    case resetResult
    
    var description: String {
        switch self {
        case .resetResult: return "Сбросить все результаты"
        }
    }
    
    var containsSwitch: Bool {
        return false
    }
}
