//
//  ClassTableViewCell.swift
//  Day06-homework
//
//  Created by Enrik on 10/24/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelClassName: UILabel!
    
    @IBOutlet weak var labelNumberOfStudents: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
