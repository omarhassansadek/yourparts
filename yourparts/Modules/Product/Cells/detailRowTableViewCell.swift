//
//  extraProductsTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailRowTableViewCell: UITableViewCell {

    
    @IBOutlet weak var rightLbl: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var leftLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.leftLbl.font = UIFont(name: "Cairo-Regular", size: 12)
        self.rightLbl.font = UIFont(name: "Cairo-Regular", size: 12)



    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
