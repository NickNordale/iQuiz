//
//  Quizzes.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import Foundation
import UIKit

class Quizzes: NSObject {
    
    // Properties
    var data: [Quiz]
    
    init() {
        data = [Quiz]()
    }
    
    init(arr: [Quiz], imgs: [UIImage]) {
        data = arr
        data[0].qImage = imgs[0]
        data[1].qImage = imgs[1]
        data[2].qImage = imgs[2]
    }
}