//
//  Question.swift
//  Quizzler
//
//  Created by Alexander on 4.06.24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
