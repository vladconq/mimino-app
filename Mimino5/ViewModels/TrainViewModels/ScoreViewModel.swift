//
//  ScoreViewModel.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

protocol ScoreViewModelDelegate {
    func updateScoreView()
}

class ScoreViewModel {
    
    // MARK: - Properties
    
    // init
    let sectionTrainType: SectionTrainType
    
    // ui
    var numberOfCorrectAnswers = 0
    var numberOfWrongAnswers = 0
    var numberOfSkippedAnswers = 0
    
    var headerLabelText: String {
        let totalNumberOfAnswers = numberOfCorrectAnswers + numberOfWrongAnswers + numberOfSkippedAnswers
        let successRatio = Double(numberOfCorrectAnswers) / Double(totalNumberOfAnswers)
        
        switch successRatio {
        case 0:
            return ["Не надо так 🙁", "Ты старался? 🧐", "Всё мимо 😔"].randomElement()!
        case 0.0.nextUp...0.5:
            return [ "Попробуй ещё 🙏🏻", "Нужно подучить 🧐", "Старайся больше ☝🏻"].randomElement()!
        case 0.5.nextUp...0.75:
            return ["Ты можешь больше 🙌🏻", "Можно еще лучше ☝🏻", "Стоит доучить пробелы ✊🏻"].randomElement()!
        case 0.75.nextUp..<1:
            return ["Молодец, но доучи пробелы 💪🏻", "Очень хорошо 👍🏻", "Хорошо, но ещё не предел ⚡️"].randomElement()!
        case 1:
            return ["Ни одной ошибки! 🚀", "Ты молодец! 🥳", "Всё верно! 😏"].randomElement()!
        default:
            return "default"
        }
    }
    
    // MARK: Lifecycle
    init(sectionTrainType: SectionTrainType) {
        self.sectionTrainType = sectionTrainType
    }
    
    // MARK: - Helpers
    
    func incrementNumberOfCorrectAnswers() {
        numberOfCorrectAnswers += 1
    }
    
    func incrementNumberOfWrongAnswers() {
        numberOfWrongAnswers += 1
    }
    
    func incrementNumberOfSkippedAnswers() {
        numberOfSkippedAnswers += 1
    }
    
}
