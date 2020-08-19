//
//  extraProductTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class extraProductTableViewCell: UITableViewCell {

    @IBOutlet weak var extraProductTitle: UILabel!
    @IBOutlet weak var productView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.productView.layer.cornerRadius = self.productView.frame.width / 2.0
        self.productView.layer.borderColor = UIColor.lightGray.cgColor
        self.productView.layer.borderWidth = 1.0
        self.extraProductTitle.text = "بلية سير دينامو"
        self.extraProductTitle.font = UIFont(name: "Cairo-SemiBold", size: 12)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
