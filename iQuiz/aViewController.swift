//
//  aViewController.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit

class aViewController: UIViewController {
    
    var quizzes = [Quiz]()
    
    var quiz = Quiz()
    var answers = [Int]()
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var qText: UILabel!
    @IBOutlet weak var correctAns: UILabel!
    @IBOutlet weak var successText: UILabel!
    
    @IBAction func nextFunc(sender: AnyObject) {
        if answers.count < quiz.qQuestions.count {
            self.performSegueWithIdentifier("question", sender: nil)
        } else {
            self.performSegueWithIdentifier("results", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qText.text = "Question: \(quiz.qQuestions[answers.count - 1].qText)"
        correctAns.text = "Answer: \(quiz.qQuestions[answers.count - 1].qAnswers[quiz.qQuestions[answers.count - 1].qAnswer])"
        
        if answers[answers.count - 1] == quiz.qQuestions[answers.count - 1].qAnswer {
            successText.text = "Woohoo! You got it."
        } else {
            successText.text = "Sorry! Wrong answer."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "question" {
            let vc = segue.destinationViewController as! qViewController
            vc.quiz = self.quiz
            vc.answers = self.answers
            vc.quizzes = self.quizzes
        } else if segue.identifier == "results" {
            let vc = segue.destinationViewController as! FinishedViewController
            vc.quiz = self.quiz
            vc.answers = self.answers
            vc.quizzes = quizzes
        }
    }
    
}
