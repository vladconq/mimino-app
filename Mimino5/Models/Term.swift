//
//  Term.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import Foundation

class Term {
    let origin: String
    let pronunciationAudioPath: String
    
    init(origin: String, pronunciationAudioPath: String) {
        self.origin = origin
        self.pronunciationAudioPath = pronunciationAudioPath
    }
}

class Letter: Term {
    let transliteration: String
    let clarification: String
    
    init(origin: String, pronunciationAudioPath: String, transliteration: String, clarification: String) {
        self.transliteration = transliteration
        self.clarification = clarification
        super.init(origin: origin, pronunciationAudioPath: pronunciationAudioPath)
    }
}

class Word: Term {
    let translation: String
    
    init(origin: String, translation: String, pronunciationAudioPath: String) {
        self.translation = translation
        super.init(origin: origin, pronunciationAudioPath: pronunciationAudioPath)
    }
}
