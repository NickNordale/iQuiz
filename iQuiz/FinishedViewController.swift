//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/16/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    @IBOutlet weak var descriptiveText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
