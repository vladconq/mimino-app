//
//  Question.swift
//  Mimino5
//
//  Created by Vladislav on 19.10.2021.
//

import Foundation

struct Question {
    let text: String
    var answers: [Answer]
}

struct Answer: Equatable {
    let text: String
    let correct: Bool
}
