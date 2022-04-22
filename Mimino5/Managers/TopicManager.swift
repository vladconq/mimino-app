//
//  TopicManager.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

protocol TopicManagerDelegate {
    func updateActiveTopicInfo()
}

class TopicManager {
    
    // MARK: - Properties
    
    static var shared = TopicManager()
    
    // delegate
    var delegate: TopicManagerDelegate?
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Helpers
    
    func getTopics() -> [Topic] {
        return DataTopics.topics.sorted { $0.name < $1.name}
    }
    
    func getActiveTopic() -> Topic {
        if let activeTopicName = UserDefaults.standard.string(forKey: "activeTopicName") {
            return DataTopics.topics.filter({ $0.name == activeTopicName }).first!
        } else {
            let randomTopic = DataTopics.topics.randomElement()!
            setActiveTopic(topic: randomTopic)
            return randomTopic
        }
    }
    
    func setActiveTopic(topic: Topic) {
        UserDefaults.standard.setValue(topic.name, forKey: "activeTopicName")
        delegate?.updateActiveTopicInfo()
    }
    
    func getQuizQuestions() -> [Question] {
        
        // array for result
        var questions = [Question]()
        
        let activeTopic = getActiveTopic()
        
        for word in activeTopic.words {
            
            // append letter info as correct answer (and first answer)
            var answers = [Answer]()
            let correctAnswer = Answer(text: word.translation, correct: true)
            answers.append(correctAnswer)
            
            var wordsCopy = activeTopic.words // make a copy of the array for the possibility of removing elements
            wordsCopy.remove(at: wordsCopy.firstIndex { $0.translation == word.translation }!) // remove letter
            
            // add three more random answers
            for _ in 0...2 {
                let randomWord = wordsCopy.randomElement()! // choose random element from lettersCopy
                answers.append(Answer(text: randomWord.translation, correct: false)) // append this element to answers
                wordsCopy.remove(at: wordsCopy.firstIndex { $0.translation == randomWord.translation }!)
            }
            
            // create question object and append it to all questions
            let question = Question(text: word.origin, answers: answers.shuffled())
            questions.append(question)
        }
        
        return questions.shuffled()
    }
    
}
