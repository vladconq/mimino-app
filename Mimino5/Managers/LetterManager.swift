//
//  LetterManager.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

class LetterManager {
    
    // MARK: - Properties
    
    static var shared = LetterManager()
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Helpers
    
    func getLetters() -> [Letter] {
        return DataLetter.letters
    }
    
    func getQuizQuestions() -> [Question] {
        
        // array for result
        var questions = [Question]()
        
        for letter in getLetters() {
            
            // append letter info as correct answer (and first answer)
            var answers = [Answer]()
            let correctAnswer = Answer(text: letter.transliteration, correct: true)
            answers.append(correctAnswer)
            
            var lettersCopy = getLetters() // make a copy of the array for the possibility of removing elements
            lettersCopy.remove(at: lettersCopy.firstIndex { $0.transliteration == letter.transliteration }!) // remove letter
            
            // add three more random answers
            for _ in 0...2 {
                let randomLetter = lettersCopy.randomElement()! // choose random element from lettersCopy
                answers.append(Answer(text: randomLetter.transliteration, correct: false)) // append this element to answers
                lettersCopy.remove(at: lettersCopy.firstIndex { $0.transliteration == randomLetter.transliteration }!)
            }
            
            // create question object and append it to all questions
            let question = Question(text: letter.origin, answers: answers.shuffled())
            questions.append(question)
        }
        
        return questions.shuffled()
    }
    
}
