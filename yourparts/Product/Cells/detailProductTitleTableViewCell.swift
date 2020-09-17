//
//  chooseAdrressTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailProductTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var roundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.roundView.layer.cornerRadius = 12.0
        
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
