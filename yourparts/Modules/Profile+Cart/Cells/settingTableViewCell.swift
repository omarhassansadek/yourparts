//
//  settingTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/23/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class settingTableViewCell: UITableViewCell {

    @IBOutlet weak var optionName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.optionName.font = UIFont(name: "Cairo-SemiBold", size: 14)

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
