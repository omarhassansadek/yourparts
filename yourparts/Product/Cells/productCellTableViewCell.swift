//
//  productCellTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/5/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class productCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellValue: UILabel!
    @IBOutlet weak var cellKey: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.cellKey.font = UIFont(name: "Cairo-SemiBold", size: 14)

        self.cellValue.font = UIFont(name: "Cairo-Regular", size: 12)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
