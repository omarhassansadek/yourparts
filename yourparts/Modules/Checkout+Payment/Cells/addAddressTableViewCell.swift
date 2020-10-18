//
//  addAddressTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/20/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addAddressTableViewCell: UITableViewCell {

    @IBOutlet var addAddressBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.addAddressBtn.layer.cornerRadius = 20.0
        self.addAddressBtn.setTitle("Add Address".localized, for: .normal)
        self.addAddressBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addAddressBtnClicked(_ sender: Any) {
        if let addAddressClicked = self.addAddress{
                 addAddressClicked()
        }

    }
    
    var addAddress : (() -> Void)? = nil

    
}
