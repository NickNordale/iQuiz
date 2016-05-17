//
//  Question.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import Foundation

class Question {
    
    // Properties
    
    var qText: String
    var qAnswer: Int
    var qAnswers: [String]
    
    init(text: String, answer: Int, answers: [String]) {
        qText = text
        qAnswer = answer
        qAnswers = answers
    }
}