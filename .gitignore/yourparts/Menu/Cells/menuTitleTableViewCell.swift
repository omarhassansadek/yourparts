//
//  menuTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 6/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class menuTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var imgThumb: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.titleCell.font = UIFont(name: "TheMixArab-Bold", size: 16)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
