//
//  searchtiresTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class searchtiresTableViewCell: UITableViewCell {

    @IBOutlet weak var searchText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.searchText.font = UIFont(name: "TheMixArab", size: 12)
        self.searchText.text = "Search brand or model".localized
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
