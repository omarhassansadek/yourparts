//
//  profileInfoTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 6/26/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class profileInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellThumb: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileDate: UILabel!
    @IBOutlet weak var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellThumb.layer.cornerRadius = 17.5
        
        self.profileName.font = UIFont(name: "TheMixArab-Bold", size: 14)
        self.profileDate.font = UIFont(name: "TheMixArab", size: 11)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
