//
//  oilTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class oilTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var oilCount: UILabel!
    @IBOutlet weak var oilName: UILabel!
    @IBOutlet weak var containerView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        self.oilName.font = UIFont(name: "TheMixArab-Bold", size: 15)

        self.oilCount.font = UIFont(name: "TheMixArab", size: 12)


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
