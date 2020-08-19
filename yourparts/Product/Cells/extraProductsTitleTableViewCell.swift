//
//  extraProductsTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class extraProductsTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var addExtraProductsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addExtraProductsTitle.text = "قطع إضافية لازمة لعملية التركيب"
        self.addExtraProductsTitle.font = UIFont(name: "Cairo-SemiBold", size: 14)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
