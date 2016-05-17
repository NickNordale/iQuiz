//
//  Quizzes+CoreDataProperties.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Quizzes {
    
    class AppQuizzes: NSManagedObject {
        @NSManaged var quizData: [Quiz]?
    }


}
