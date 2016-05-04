//
//  ViewController.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/1/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {
    @IBOutlet weak var table: UITableView!
    
    var quizzes = [Quiz]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuizzes()
    }
    
    func loadQuizzes() {
        let image1 = UIImage(named: "math")!
        let image2 = UIImage(named: "marvel")!
        let image3 = UIImage(named: "science")!
        
        let quiz1 = Quiz(name: "Mathematics", description: "Math description.", image: image1)
        let quiz2 = Quiz(name: "Marvel Super Heroes", description: "Marvel description.", image: image2)
        let quiz3 = Quiz(name: "Science", description: "Science description.", image: image3)
        
        quizzes += [quiz1, quiz2, quiz3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quizzes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "QuizTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! QuizTableViewCell
        
        let quiz = quizzes[indexPath.row]
        
        cell.qName.text = quiz.qName
        cell.qDescription.text = quiz.qDescription
        cell.qImage.image = quiz.qImage
        
        return cell
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        let alertController : UIAlertController = UIAlertController(title: "Settings alert", message: "Settings go here", preferredStyle: .Alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .Default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissAlert(alert: UIAlertAction!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

