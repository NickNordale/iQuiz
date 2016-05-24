//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var quizzes = [Quiz]()
    
    var quiz = Quiz()
    var answers = [Int]()
    
    var correctCount = 0
    
    @IBOutlet weak var descriptiveText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptiveText.text = "Here are your results for the \(quiz.qName) quiz:"
        var resString = ""
        for i in 0...(quiz.qQuestions.count - 1) {
            resString += "Question \(i + 1): \(quiz.qQuestions[i].qText)\n"
            if answers[i] == quiz.qQuestions[i].qAnswer {
                resString += "\tCorrect :)\n\n"
                correctCount += 1
            } else {
                resString += "\tIncorrect :(\n\n"
            }
        }
        resString += "You got \(Int(round(100 * Double(correctCount)/Double(quiz.qQuestions.count))))%"
        scoreText.text = resString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "done table" {
            let vc = segue.destinationViewController as! ViewController
            vc.quizzes = self.quizzes
        }
    }
    

}
