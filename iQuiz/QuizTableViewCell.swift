//
//  QuizTableViewCell.swift
//  iQuiz
//
//  Created by Nick Nordale on 5/1/16.
//  Copyright © 2016 Nick Nordale. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    // Properties
    
    @IBOutlet weak var qName: UILabel!
    @IBOutlet weak var qDescription: UILabel!    
    @IBOutlet weak var qImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

