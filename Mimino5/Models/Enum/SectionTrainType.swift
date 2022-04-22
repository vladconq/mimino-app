//
//  SectionTrainType.swift
//  Mimino5
//
//  Created by Vladislav on 17.10.2021.
//

import UIKit

enum SectionTrainType: String, CaseIterable {
    
    case letterAlphabet = "letterAlphabet"
    case letterQuiz = "letterQuiz"
    case letterMemory = "letterMemory"
    case wordQuiz = "wordQuiz"
    case wordMemory = "wordMemory"
    
    var name: String {
        switch self {
        case .letterAlphabet:
            return "Алфавит"
        case .letterQuiz, .wordQuiz:
            return "Квиз"
        case .letterMemory, .wordMemory:
            return "Карточки"
        }
    }
    
    var description: String {
        switch self {
        case .letterAlphabet:
            return "Познакомься со всеми буквами алфавита"
        case .letterQuiz:
            return "Сопоставляй буквам их произношение"
        case .letterMemory:
            return "Вспоминай произношение букв по карточкам"
        case .wordQuiz:
            return "Выбирай верный перевод словам"
        case .wordMemory:
            return "Вспоминай перевод слов"
        }
    }
    
    var highScoreText: String? {
        switch self {
        case .letterAlphabet:
            return nil
        case .letterQuiz:
            return "лучший результат в квизе"
        case .letterMemory:
            return "лучший результат по карточкам"
        case .wordQuiz:
            return "рекорд в квизе"
        case .wordMemory:
            return "рекорд по карточкам"
        }
    }
    
    var colorTheme: UIColor {
        switch self {
        case .letterAlphabet:
            return .letterAlphabetColor
        case .letterQuiz:
            return .letterQuizColor
        case .letterMemory:
            return .letterMemoryColor
        case .wordQuiz:
            return .wordQuizColor
        case .wordMemory:
            return .wordMemoryColor
        }
    }
    
    var circleCenterPoint: CGPoint {
        switch self {
        case .letterAlphabet:
            return CGPoint(x: 280, y: 20)
        case .letterQuiz:
            return CGPoint(x: 310, y: 35)
        case .letterMemory:
            return CGPoint(x: 270, y: 85)
        case .wordQuiz:
            return CGPoint(x: 70, y: 35)
        case .wordMemory:
            return CGPoint(x: 90, y: 85)
        }
    }
    
    var menuButtonHeight: CGFloat {
        switch self {
        case .letterAlphabet, .letterMemory, .letterQuiz:
            return 125
        case .wordQuiz, .wordMemory:
            return 150
        }
    }
    
    var tipHeaderText: String? {
        switch self {
        case .letterMemory, .wordMemory:
            return "Правила карточек"
        case .letterQuiz, .wordQuiz:
            return "Правила квиза"
        default:
            return nil
        }
    }
    
    var tipDescriptionText: String? {
        switch self {
        case .letterQuiz:
            return "В данной тренировке необходимо выбрать верное произношение для отображаемой буквы. Не бойся сделать ошибку и поменьше отвечай «не знаю»\u{A0}- так процесс будет продуктивнее."
        case .letterMemory:
            return "В данной тренировке необходимо вспомнить произношение отображаемой буквы. Будьте честны перед собой и тогда результат не заставит себя ждать."
        case .wordQuiz:
            return "В данной тренировке необходимо выбрать верный перевод отображаемого слова. Не бойся сделать ошибку и поменьше отвечай «не знаю»\u{A0} - так процесс будет продуктивнее."
        case .wordMemory:
            return "В данной тренировке необходимо вспомнить перевод отображаемого слова. Будьте честны перед собой и тогда результат не заставит себя ждать."
        default:
            return nil
        }
    }
    
}
