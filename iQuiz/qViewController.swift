//
//  qViewController.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit

class qViewController: UIViewController {
    
    var quizzes = [Quiz]()
    
    var quiz = Quiz()
    var currentSelection = 0
    var answers = [Int]()
    
    @IBOutlet weak var qText: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var submit: UIButton!

    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func answerSelection(sender: UIButton) {
        if sender.accessibilityIdentifier == "1" {
            recolor(0)
            currentSelection = 1
        }
        else if sender.accessibilityIdentifier == "2" {
            recolor(1)
            currentSelection = 2
        }
        else if sender.accessibilityIdentifier == "3" {
            recolor(2)
            currentSelection = 3
        }
        else if sender.accessibilityIdentifier == "4" {
            recolor(3)
            currentSelection = 4
        }
        submit.userInteractionEnabled = true
    }
    
    func recolor(buttonSelection: Int) {
        let bArr = [answer1, answer2, answer3, answer4]
        for i in 0...(bArr.count - 1) {
            if i == buttonSelection {
                bArr[i].backgroundColor = UIColor.grayColor()
            }
            else {
                bArr[i].backgroundColor = UIColor.whiteColor()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.userInteractionEnabled = false
        qText.text = quiz.qQuestions[answers.count].qText
        answer1.setTitle(quiz.qQuestions[answers.count].qAnswers[0], forState: .Normal)
        answer2.setTitle(quiz.qQuestions[answers.count].qAnswers[1], forState: .Normal)
        answer3.setTitle(quiz.qQuestions[answers.count].qAnswers[2], forState: .Normal)
        answer4.setTitle(quiz.qQuestions[answers.count].qAnswers[3], forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        answers.append(currentSelection)
        if segue.identifier == "answer" {
            let vc = segue.destinationViewController as! aViewController
            vc.quiz = self.quiz
            vc.answers = self.answers
            vc.quizzes = quizzes
        }
    }

}
