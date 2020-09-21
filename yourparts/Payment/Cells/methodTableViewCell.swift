//
//  methodTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import BEMCheckBox

class methodTableViewCell: UITableViewCell {

    @IBOutlet weak var methodBox: BEMCheckBox!
    @IBOutlet weak var methodname: UILabel!
    @IBOutlet weak var methodico: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
