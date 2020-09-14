//
//  detailCatTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailCatTableViewCell: UITableViewCell {

    @IBOutlet weak var catName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.catName.text = "Tire for your car".localized

        self.catName.font = UIFont(name: "Cairo-Bold", size: 14)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
