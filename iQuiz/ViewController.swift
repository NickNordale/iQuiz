//
//  ViewController.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/1/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {
    @IBOutlet weak var qTableView: UITableView!
    
    var quizzes = [Quiz]()
    var json: AnyObject = ""
    var images = [UIImage(named: "science")!, UIImage(named: "marvel")!, UIImage(named: "math")!]
    
    var urlAlertField = ""
    
    let nsDefaults = NSUserDefaults.standardUserDefaults()
    var quizData: NSData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.qTableView.delegate = self
        self.qTableView.dataSource = self
        loadQuizzes()
    }
    
    func loadQuizzes() {
        if quizzes.count != 0 {
            let image1 = UIImage(named: "math")!
            let image2 = UIImage(named: "marvel")!
            let image3 = UIImage(named: "science")!
            
            quizzes[0].qImage = image1
            quizzes[1].qImage = image2
            quizzes[2].qImage = image3
            
            self.qTableView.reloadData()
        }
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
        
        if quizzes.count != 0 {
            let quiz = quizzes[indexPath.row]
            
            cell.qName.text = quiz.qName
            cell.qDescription.text = quiz.qDescription
            cell.qImage.image = quiz.qImage
        }
        return cell
    }
    
    func parseJson(dataIn: AnyObject) {
        var getQuizzes = [Quiz]()
        if let jsonQuizzes = dataIn as? [[String: AnyObject]] {
            for jsonObj in jsonQuizzes {
                let newQuiz : Quiz = Quiz()
                if let ifQuestions = jsonObj["questions"] as? [[String: AnyObject]] {
                    for question in ifQuestions {
                        let textParsed = (question["text"] as? String)!
                        let answerParsed = (question["answer"] as? String)!
                        let answersParsed = (question["answers"] as? [String])!
                        let newQuestion : Question = Question(text: textParsed, answer: Int(answerParsed)!, answers: answersParsed)
                        newQuiz.qQuestions.append(newQuestion)
                    }
                }
                
                if let ifTitle = jsonObj["title"] as? String {
                    newQuiz.qName = ifTitle
                }
                
                if let ifDesc = jsonObj["desc"] as? String {
                    newQuiz.qDescription = ifDesc
                }
                getQuizzes.append(newQuiz)
            }
        }
        quizzes = getQuizzes
        loadQuizzes()
    }
    
    func getData(urlPassed: String) {
        let requestURL: NSURL = NSURL(string: urlPassed)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                do{
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    self.json = jsonData
                    self.nsDefaults.setObject(self.json, forKey: "qdata")
                    self.parseJson(self.json)
                } catch {
                    let downloadErrorAlertController : UIAlertController = UIAlertController(title: "Error downloading data", message: "Loading data now from local storage", preferredStyle: .Alert)
                    let deOkAction : UIAlertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: self.dismissAlert)
                    downloadErrorAlertController.addAction(deOkAction)
                    self.presentViewController(downloadErrorAlertController, animated: true, completion: nil)
                    self.json = (self.nsDefaults.objectForKey("qdata") as? NSData)!
                    self.parseJson(self.json)
                }
            }
        }
        task.resume()
    }

    @IBAction func showAlert(sender: AnyObject) {
        var urlInputField : UITextField?
        let alertController : UIAlertController = UIAlertController(title: "Settings alert", message: "Settings go here", preferredStyle: .Alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .Default, handler: dismissAlert)
        
        alertController.addAction(okAction)
        
        alertController.addTextFieldWithConfigurationHandler { (urlIn: UITextField!) in
            urlIn.placeholder = "enter a url to download quiz data"
            urlInputField = urlIn
        }
        
        let checkNow : UIAlertAction = UIAlertAction(title: "Check now", style: .Default, handler: { (action) -> Void in
            if urlInputField!.text == "http://tednewardsandbox.site44.com/questions.json" {
                self.getData(urlInputField!.text!)
            } else {
                self.dismissAlert(okAction)
                let errorAlertController : UIAlertController = UIAlertController(title: "Invalid URL", message: "url is not valid json data address", preferredStyle: .Alert)
                let errorOkAction : UIAlertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: self.dismissAlert)
                errorAlertController.addAction(errorOkAction)
                self.presentViewController(errorAlertController, animated: true, completion: nil)
            }
        })
        
        alertController.addAction(checkNow)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissAlert(alert: UIAlertAction!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "question") {
            let qVC = segue.destinationViewController as! qViewController
            qVC.quiz = quizzes[(qTableView.indexPathForSelectedRow?.row)!]
            qVC.quizzes = quizzes
        }
    }
}

