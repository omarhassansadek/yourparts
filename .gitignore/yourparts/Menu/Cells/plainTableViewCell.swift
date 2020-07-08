//
//  plainTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 6/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class plainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellSeparator: UIView!
    @IBOutlet weak var cellLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellLbl.font = UIFont(name: "TheMixArab-Bold", size: 13)

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
