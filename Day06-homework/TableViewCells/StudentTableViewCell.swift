//
//  StudentTableViewCell.swift
//  Day06-homework
//
//  Created by Enrik on 10/25/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAvatar: UIImageView!
    
    @IBOutlet weak var labelStudentName: UILabel!
    
    @IBOutlet weak var labelStudentAddress: UILabel!
    
    @IBOutlet weak var labelStudentBirthday: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
