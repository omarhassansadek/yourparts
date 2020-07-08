//
//  addTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 6/27/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    var addAddress : (() -> Void)? = nil
    
    @IBAction func addAddressBtn(_ sender: Any) {
        if let addAddressClicked = self.addAddress{
            addAddressClicked()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
