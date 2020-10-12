
//
//  detailOilTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailOilTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cellDetail2: UILabel!
    @IBOutlet weak var cellDetail1: UILabel!
    @IBOutlet weak var cellLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        self.cellLbl.font = UIFont(name: "TheMixArab-Bold", size: 13)
        
        self.cellDetail1.font = UIFont(name: "TheMixArab", size: 12)

        self.cellDetail2.font = UIFont(name: "TheMixArab", size: 12)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
