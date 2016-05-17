//
//  Quiz.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/1/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    
    // Properties
    
    var qName: String
    var qDescription: String
    var qImage: UIImage?
    var qQuestions: [Question]
    
    init(name: String, description: String, questions: [Question]) {
        qName = name
        qDescription = description
        qQuestions = questions
    }
    
    init() {
        qName = ""
        qDescription = ""
        qQuestions = [Question]()
    }
}